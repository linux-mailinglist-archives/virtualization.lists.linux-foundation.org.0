Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A9331C1F2
	for <lists.virtualization@lfdr.de>; Mon, 15 Feb 2021 19:51:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C577886B30;
	Mon, 15 Feb 2021 18:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8v6iVXT+eQE; Mon, 15 Feb 2021 18:51:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFE3886B41;
	Mon, 15 Feb 2021 18:51:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71D1BC013A;
	Mon, 15 Feb 2021 18:51:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A398C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 18:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8131086B6F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 18:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8Thn37pP87O
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 18:51:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A603186B2C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Feb 2021 18:51:53 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11FIWbZf048581; Mon, 15 Feb 2021 13:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=fKzuzJwZXNbcqlaqmh6x1fdsMFs6X8oORRG/w+XcSg8=;
 b=WD/9a+WDRV7v8iq3+RC3/p58sz0ZZjiUySaTtVVqrNbjsjl1AfuNzKnsukf2hID/Jcs3
 Xr5aPoEcRmFIbm0LZa3qfORg/hojd+KqfPJ75fCbIf//mZ/BOLlqmdp4sPbFkdWrk+tK
 E1yvEi7Ahe/3T2QYoeDFo54H1c/qpUSSgpdDktT6u0MC21PmsUA1CVRh5D9Jk8wXwF4I
 QGSxpFGDE3rNAJ98GgzZh/Z3dJxvSqPGX5M4druxgp7Hp9XX/NT8W7s8gr1qGOfRwORX
 DQFkRz7fujd9I0DqtkY2ocq3GHvRH1f1OTM4hliP/VKWnCGssKX0WIbqrBMx+TZFQjvz 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36qx650pk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 13:51:52 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11FIXvti053516;
 Mon, 15 Feb 2021 13:51:52 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36qx650pjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 13:51:52 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11FIc0HM021221;
 Mon, 15 Feb 2021 18:51:50 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 36p61h93uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 18:51:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11FIpaB528180948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 18:51:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD413A404D;
 Mon, 15 Feb 2021 18:51:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8624CA4040;
 Mon, 15 Feb 2021 18:51:47 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 15 Feb 2021 18:51:47 +0000 (GMT)
Date: Mon, 15 Feb 2021 19:51:44 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio/s390: implement virtio-ccw revision 2 correctly
Message-ID: <20210215195144.7b96b41f.pasic@linux.ibm.com>
In-Reply-To: <20210215124702.23a093b8.cohuck@redhat.com>
References: <20210212170411.992217-1-cohuck@redhat.com>
 <20210215124702.23a093b8.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_14:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150141
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 Pierre Morel <pmorel@linux.ibm.com>, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, 15 Feb 2021 12:47:02 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, 12 Feb 2021 18:04:11 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > CCW_CMD_READ_STATUS was introduced with revision 2 of virtio-ccw,
> > and drivers should only rely on it being implemented when they
> > negotiated at least that revision with the device.
> > 
> > However, virtio_ccw_get_status() issued READ_STATUS for any
> > device operating at least at revision 1. If the device accepts
> > READ_STATUS regardless of the negotiated revision (which it is
> > free to do),  
> 
> So, looking at the standard again, the device is actually required to
> reject the READ_STATUS if only rev 1 had been negotiated... regardless
> of that, I don't think we should change QEMU's behaviour, as it would
> affect existing guests (they would lose access to the status bits as
> observed by the device, including DEVICE_NEEDS_RESET.)

Not only that, without READ_STATUS, we can't do device reset which
is a prerequisite for a proper cleanup, as required by the spec.

You certainly remember, the driver has may not assume the reset
was performed (and thus virtqueues are not live) until it reads
back status 0. But without READ_STATUS virtio_ccw_get_status() will
keep returning the status the driver last set via
virtio_ccw_set_status(). And CCW_CMD_VDEV_RESET is of course
revision 1 material. This looks ugly!

> 
> > everything works as intended; a device rejecting the
> > command should also be handled gracefully. For correctness, we
> > should really limit the command to revision 2 or higher, though.
> > 
> > We also negotiated the revision to at most 1, as we never bumped
> > the maximum revision; let's do that now.
> > 
> > Fixes: 7d3ce5ab9430 ("virtio/s390: support READ_STATUS command for virtio-ccw")
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > QEMU does not fence off READ_STATUS for revisions < 2, which is probably
> > why we never noticed this. I'm not aware of other hypervisors that do
> > fence it off, nor any that cannot deal properly with an unknown command.
> > 
> > Not sure whether this is stable worthy?  
> 
> Maybe it is, given the MUST reject clause in the standard?
> 

Yes, IMHO this must be backported. A device that ain't violating the
spec would currently reject READ_STATUS. Which would break RESET_VDEV
like I described above.

Can we change that MUST to should? There are now good reasons for not
doing like the spec says in case of READ_STATUS.

> > 
> > ---
> >  drivers/s390/virtio/virtio_ccw.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > index 5730572b52cd..54e686dca6de 100644
> > --- a/drivers/s390/virtio/virtio_ccw.c
> > +++ b/drivers/s390/virtio/virtio_ccw.c
> > @@ -117,7 +117,7 @@ struct virtio_rev_info {
> >  };
> >  
> >  /* the highest virtio-ccw revision we support */
> > -#define VIRTIO_CCW_REV_MAX 1
> > +#define VIRTIO_CCW_REV_MAX 2
> >  
> >  struct virtio_ccw_vq_info {
> >  	struct virtqueue *vq;
> > @@ -952,7 +952,7 @@ static u8 virtio_ccw_get_status(struct virtio_device *vdev)
> >  	u8 old_status = vcdev->dma_area->status;
> >  	struct ccw1 *ccw;
> >  
> > -	if (vcdev->revision < 1)
> > +	if (vcdev->revision < 2)
> >  		return vcdev->dma_area->status;

I don't think our faking of the status read (i.e. returning the old one)
is contributing to spec compliance. Especially not if the inability to
READ is not transient.

Also return old_status; would tell the story better, but on the
other hand, that would be an unrelated cosmetic change. Maybe
a separate patch?

Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

Regards,
Halil

> >  
> >  	ccw = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*ccw));  
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
