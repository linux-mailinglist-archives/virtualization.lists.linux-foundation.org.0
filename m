Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2183718179
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 23:08:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B266E54;
	Wed,  8 May 2019 21:08:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9EF92A70
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 21:08:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2D780196
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 21:08:20 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x48L5D46023198 for <virtualization@lists.linux-foundation.org>;
	Wed, 8 May 2019 17:08:19 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sc6qdr4r9-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 08 May 2019 17:08:18 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Wed, 8 May 2019 22:08:17 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 8 May 2019 22:08:13 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x48L8CtC48038038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 8 May 2019 21:08:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 598C84C04E;
	Wed,  8 May 2019 21:08:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90B9F4C044;
	Wed,  8 May 2019 21:08:11 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.71.200])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  8 May 2019 21:08:11 +0000 (GMT)
Date: Wed, 8 May 2019 23:08:09 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Sebastian Ott <sebott@linux.ibm.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
In-Reply-To: <alpine.LFD.2.21.1905081522300.1773@schleppi>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
	<alpine.LFD.2.21.1905081522300.1773@schleppi>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050821-0016-0000-0000-00000279B159
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050821-0017-0000-0000-000032D662B1
Message-Id: <20190508230809.6b0faaf7.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-08_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=879 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905080127
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

On Wed, 8 May 2019 15:46:42 +0200 (CEST)
Sebastian Ott <sebott@linux.ibm.com> wrote:

> 
> On Fri, 26 Apr 2019, Halil Pasic wrote:
> >  static struct ccw_device * io_subchannel_allocate_dev(struct subchannel *sch)
> >  {
> [..]
> > +	cdev->private = kzalloc(sizeof(struct ccw_device_private),
> > +				GFP_KERNEL | GFP_DMA);
> 
> Do we still need GFP_DMA here (since we now have cdev->private->dma_area)?
> 

We probably do not. I kept it GFP_DMA to keep changes to the
minimum. Should changing this in your opinion be a part of this patch?

> > @@ -1062,6 +1082,14 @@ static int io_subchannel_probe(struct subchannel *sch)
> >  	if (!io_priv)
> >  		goto out_schedule;
> >  
> > +	io_priv->dma_area = dma_alloc_coherent(&sch->dev,
> > +				sizeof(*io_priv->dma_area),
> > +				&io_priv->dma_area_dma, GFP_KERNEL);
> 
> This needs GFP_DMA.

Christoph already answered this one. Thanks Christoph!

> You use a genpool for ccw_private->dma and not for iopriv->dma - looks
> kinda inconsistent.
> 

Please have a look at patch #9. A virtio-ccw device uses the genpool of
it's ccw device (the pool from which ccw_private->dma is allicated) for
the ccw stuff it needs to do. AFAICT for a subchannel device and its API
all the DMA memory we need is iopriv->dma. So my thought was
constructing a genpool for that would be an overkill.

Are you comfortable with this answer, or should we change something?

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
