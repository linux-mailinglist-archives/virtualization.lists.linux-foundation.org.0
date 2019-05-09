Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825E1871C
	for <lists.virtualization@lfdr.de>; Thu,  9 May 2019 10:54:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1B03DC9B;
	Thu,  9 May 2019 08:54:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 14BD7C9B
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 08:54:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9A9691FB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 08:54:36 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x498sP0c079170 for <virtualization@lists.linux-foundation.org>;
	Thu, 9 May 2019 04:54:35 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2scfhym867-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 09 May 2019 04:54:30 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<sebott@linux.ibm.com>; Thu, 9 May 2019 09:52:53 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 9 May 2019 09:52:48 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x498qloT46792932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 9 May 2019 08:52:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E208A4204C;
	Thu,  9 May 2019 08:52:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E5414204B;
	Thu,  9 May 2019 08:52:46 +0000 (GMT)
Received: from dyn-9-152-212-30.boeblingen.de.ibm.com (unknown [9.152.212.30])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu,  9 May 2019 08:52:46 +0000 (GMT)
Date: Thu, 9 May 2019 10:52:45 +0200 (CEST)
From: Sebastian Ott <sebott@linux.ibm.com>
X-X-Sender: sebott@schleppi
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
In-Reply-To: <20190508230809.6b0faaf7.pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
	<alpine.LFD.2.21.1905081522300.1773@schleppi>
	<20190508230809.6b0faaf7.pasic@linux.ibm.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
Organization: =?ISO-8859-15?Q?=22IBM_Deutschland_Research_&_Development_GmbH?=
	=?ISO-8859-15?Q?_=2F_Vorsitzende_des_Aufsichtsrats=3A_Matthias?=
	=?ISO-8859-15?Q?_Hartmann_Gesch=E4ftsf=FChrung=3A_Dirk_Wittkopp?=
	=?ISO-8859-15?Q?_Sitz_der_Gesellschaft=3A_B=F6blingen_=2F_Reg?=
	=?ISO-8859-15?Q?istergericht=3A_Amtsgericht_Stuttgart=2C_HRB_2432?=
	=?ISO-8859-15?Q?94=22?=
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050908-0028-0000-0000-0000036BDC01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050908-0029-0000-0000-0000242B5C52
Message-Id: <alpine.LFD.2.21.1905091041130.1779@schleppi>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=989 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905090056
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Farhan Ali <alifm@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


On Wed, 8 May 2019, Halil Pasic wrote:
> On Wed, 8 May 2019 15:46:42 +0200 (CEST)
> Sebastian Ott <sebott@linux.ibm.com> wrote:
> > On Fri, 26 Apr 2019, Halil Pasic wrote:
> > >  static struct ccw_device * io_subchannel_allocate_dev(struct subchannel *sch)
> > >  {
> > [..]
> > > +	cdev->private = kzalloc(sizeof(struct ccw_device_private),
> > > +				GFP_KERNEL | GFP_DMA);
> > 
> > Do we still need GFP_DMA here (since we now have cdev->private->dma_area)?
> > 
> 
> We probably do not. I kept it GFP_DMA to keep changes to the
> minimum. Should changing this in your opinion be a part of this patch?

This can be changed on top.

> > > @@ -1062,6 +1082,14 @@ static int io_subchannel_probe(struct subchannel *sch)
> > >  	if (!io_priv)
> > >  		goto out_schedule;
> > >  
> > > +	io_priv->dma_area = dma_alloc_coherent(&sch->dev,
> > > +				sizeof(*io_priv->dma_area),
> > > +				&io_priv->dma_area_dma, GFP_KERNEL);
> > 
> > This needs GFP_DMA.
> 
> Christoph already answered this one. Thanks Christoph!

Yes, I'm still struggling to grasp the whole channel IO + DMA API +
protected virtualization thing..

> 
> > You use a genpool for ccw_private->dma and not for iopriv->dma - looks
> > kinda inconsistent.
> > 
> 
> Please have a look at patch #9. A virtio-ccw device uses the genpool of
> it's ccw device (the pool from which ccw_private->dma is allicated) for
> the ccw stuff it needs to do. AFAICT for a subchannel device and its API
> all the DMA memory we need is iopriv->dma. So my thought was
> constructing a genpool for that would be an overkill.
> 
> Are you comfortable with this answer, or should we change something?

Nope, I'm good with that one - ccw_private->dma has multiple users that
all fit into one page.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
