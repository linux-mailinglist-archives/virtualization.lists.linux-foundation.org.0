Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 053EA2B539
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 14:30:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5DB7F1849;
	Mon, 27 May 2019 12:30:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 68D8F183A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:30:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B03CC821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:30:29 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4RCRukG076542 for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:30:28 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2srf6q2hrx-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:30:28 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Mon, 27 May 2019 13:30:24 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 27 May 2019 13:30:22 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4RCUKRt36700258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 27 May 2019 12:30:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAC0D5204F;
	Mon, 27 May 2019 12:30:19 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.72.200])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2719452051;
	Mon, 27 May 2019 12:30:19 +0000 (GMT)
Date: Mon, 27 May 2019 14:30:14 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 3/8] s390/cio: add basic protected virtualization
	support
In-Reply-To: <20190527123802.54cd3589.cohuck@redhat.com>
References: <20190523162209.9543-1-mimu@linux.ibm.com>
	<20190523162209.9543-4-mimu@linux.ibm.com>
	<20190527123802.54cd3589.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19052712-0028-0000-0000-00000371E91F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052712-0029-0000-0000-00002431A5B3
Message-Id: <20190527143014.3b48a0d2.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-27_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905270088
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	KVM Mailing List <kvm@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
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

On Mon, 27 May 2019 12:38:02 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, 23 May 2019 18:22:04 +0200
> Michael Mueller <mimu@linux.ibm.com> wrote:
> 
> > From: Halil Pasic <pasic@linux.ibm.com>
> > 
> > As virtio-ccw devices are channel devices, we need to use the dma area
> > for any communication with the hypervisor.
> > 
> > It handles neither QDIO in the common code, nor any device type specific
> > stuff (like channel programs constructed by the DASD driver).
> > 
> > An interesting side effect is that virtio structures are now going to
> > get allocated in 31 bit addressable storage.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> 
> [Side note: you really should add your s-o-b if you send someone else's
> patches... if Halil ends up committing them, it's fine, though.]
> 
> > ---
> >  arch/s390/include/asm/ccwdev.h   |  4 +++
> >  drivers/s390/cio/ccwreq.c        |  9 +++---
> >  drivers/s390/cio/device.c        | 64 +++++++++++++++++++++++++++++++++-------
> >  drivers/s390/cio/device_fsm.c    | 53 ++++++++++++++++++++-------------
> >  drivers/s390/cio/device_id.c     | 20 +++++++------
> >  drivers/s390/cio/device_ops.c    | 21 +++++++++++--
> >  drivers/s390/cio/device_pgid.c   | 22 +++++++-------
> >  drivers/s390/cio/device_status.c | 24 +++++++--------
> >  drivers/s390/cio/io_sch.h        | 20 +++++++++----
> >  drivers/s390/virtio/virtio_ccw.c | 10 -------
> >  10 files changed, 164 insertions(+), 83 deletions(-)
> > 
> 
> (...)
> 
> > @@ -1593,20 +1622,31 @@ struct ccw_device * __init ccw_device_create_console(struct ccw_driver *drv)
> >  		return ERR_CAST(sch);
> >  
> >  	io_priv = kzalloc(sizeof(*io_priv), GFP_KERNEL | GFP_DMA);
> > -	if (!io_priv) {
> > -		put_device(&sch->dev);
> > -		return ERR_PTR(-ENOMEM);
> > -	}
> > +	if (!io_priv)
> > +		goto err_priv;
> > +	io_priv->dma_area = dma_alloc_coherent(&sch->dev,
> > +				sizeof(*io_priv->dma_area),
> > +				&io_priv->dma_area_dma, GFP_KERNEL);
> 
> Even though we'll only end up here for 3215 or 3270 consoles, this sent
> me looking.
> 
> This code is invoked via console_init(). A few lines down in
> start_kernel(), we have
> 
>         /*                                                                       
>          * This needs to be called before any devices perform DMA                
>          * operations that might use the SWIOTLB bounce buffers. It will         
>          * mark the bounce buffers as decrypted so that their usage will         
>          * not cause "plain-text" data to be decrypted when accessed.            
>          */
>         mem_encrypt_init();
> 
> So, I'm wondering if creating the console device interacts in any way
> with the memory encryption interface?

I do things a bit different than x86: the SWIOTLB stuff is set up in
mem_init(). So I think we should be fine. If there is a down-side to
calling swiotlb_update_mem_attributes() earlier, honestly I'm
not sure.

> 
> [Does basic recognition work if you start a protected virt guest with a
> 3270 console? I realize that the console is unlikely to work, but that
> should at least exercise this code path.]

I've already had some thoughts along these lines and slapped  
-device x-terminal3270,chardev=char_0,devno=fe.0.000a,id=terminal_0 \
on my qemu command line. The ccw device does show up in the guest...

Device   Subchan.  DevType CU Type Use  PIM PAM POM  CHPIDs
----------------------------------------------------------------------
0.0.0000 0.0.0000  0000/00 3832/01 yes  80  80  ff   00000000 00000000 
0.0.000a 0.0.0001  0000/00 3270/00      80  80  ff   01000000 00000000 
0.0.0002 0.0.0002  0000/00 3832/09 yes  80  80  ff   00000000 00000000 
0.0.0300 0.0.0003  0000/00 3832/02 yes  80  80  ff   00000000 00000000 
0.0.0301 0.0.0004  0000/00 3832/02 yes  80  80  ff   00000000 00000000 

But I would not call it a comprehensive test...

Mimu, do we have something more elaborate with regards to this?

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
