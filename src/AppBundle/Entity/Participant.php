<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Participant
 *
 * @ORM\Table(name="participant")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ParticipantRepository")
 */
class Participant
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var int
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Epreuve")
     * @ORM\JoinColumn(name="epreuve_id", referencedColumnName="id")
     */
    private $epreuveId; 


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     * @return Participant
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

/**********************************
* ownerId
*/
    /**
     * Get epreuveID
     *
     * @return integer 
     */
    public function getEpreuveId()
    {
        return $this->epreuveId;
    }

    /**
     * Set epreuveId
     *
     * @param integer $epreuveId
     * @return Epreuve
     */
    public function setEpreuveId($epreuveId)
    {
        $this->epreuveId = $epreuveId;

        return $this;
    }
/*****************************************/

}
