<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Epreuve;
use AppBundle\Form\EpreuveType;

/**
 * Epreuve controller.
 *
 * @Route("/epreuve")
 */
class EpreuveController extends Controller
{
    /**
     * Lists all Epreuve entities.
     *
     * @Route("/", name="epreuve_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $epreuves = $em->getRepository('AppBundle:Epreuve')->findAll();

        return $this->render('epreuve/index.html.twig', array(
            'epreuves' => $epreuves,
        ));
    }

    /**
     * Lists last 3 Epreuve entities.
     *
     * @Route("/", name="epreuve_last3")
     * @Method("GET")
     */
    public function last3Action()
    {
        $em = $this->getDoctrine()->getManager();

        $epreuves = $em->getRepository('AppBundle:Epreuve')->findBY( array(), array('id'=>'DESC'), 3, 0);

        return $this->render('epreuve/last3.html.twig', array(
            'epreuves' => $epreuves,
        ));
    }

    /**
     * Creates a new Epreuve entity.
     *
     * @Route("/new", name="epreuve_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $epreuve = new Epreuve();
        $form = $this->createForm('AppBundle\Form\EpreuveType', $epreuve);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($epreuve);
            $em->flush();

            return $this->redirectToRoute('epreuve_show', array('id' => $epreuve->getId()));
        }

        return $this->render('epreuve/new.html.twig', array(
            'epreuve' => $epreuve,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Epreuve entity.
     *
     * @Route("/{id}", name="epreuve_show")
     * @Method("GET")
     */
    public function showAction(Epreuve $epreuve)
    {
        $deleteForm = $this->createDeleteForm($epreuve);


        return $this->render('epreuve/show.html.twig', array(
            'epreuve' => $epreuve,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Finds and displays a Epreuve details.
     *
     * @Route("/detail/{id}", name="epreuve_detail")
     * @Method("GET")
     */
    public function detailAction(Epreuve $epreuve)
    {   
        $em = $this->getDoctrine()->getManager();

        $participants = $em->getRepository('AppBundle:Participant')->findByEpreuveId($epreuve->getId());
        return $this->render('epreuve/detail.html.twig', array(
            'epreuve' => $epreuve,
            'participants' => $participants
        ));
    }


    /**
     * Displays a form to edit an existing Epreuve entity.
     *
     * @Route("/{id}/edit", name="epreuve_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Epreuve $epreuve)
    {
        $deleteForm = $this->createDeleteForm($epreuve);
        $editForm = $this->createForm('AppBundle\Form\EpreuveType', $epreuve);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($epreuve);
            $em->flush();

            return $this->redirectToRoute('epreuve_edit', array('id' => $epreuve->getId()));
        }

        return $this->render('epreuve/edit.html.twig', array(
            'epreuve' => $epreuve,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Epreuve entity.
     *
     * @Route("/{id}", name="epreuve_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Epreuve $epreuve)
    {
        $form = $this->createDeleteForm($epreuve);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($epreuve);
            $em->flush();
        }

        return $this->redirectToRoute('epreuve_index');
    }

    /**
     * Creates a form to delete a Epreuve entity.
     *
     * @param Epreuve $epreuve The Epreuve entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Epreuve $epreuve)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('epreuve_delete', array('id' => $epreuve->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
