Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BDC426BF9
	for <lists.virtualization@lfdr.de>; Fri,  8 Oct 2021 15:52:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C4B684054;
	Fri,  8 Oct 2021 13:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBH7XcsxCVtG; Fri,  8 Oct 2021 13:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 134EA84064;
	Fri,  8 Oct 2021 13:52:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AB0DC0022;
	Fri,  8 Oct 2021 13:52:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F8C5C000D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 13:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CC514018B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 13:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otyZ4_WvMC2I
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 13:52:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C551D400E8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 13:52:08 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198DcrWE006278; 
 Fri, 8 Oct 2021 09:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=K567I+7jxfCQg2Gkz57JmtngrImX/7p0SSN0LwX1PsY=;
 b=a1oGPW7Tph2T8irdRKGDJNX5WAfkv0qTjsyMPbxnAkE+UO0dAurNNwxi9a77Hk69sS2u
 E7CZiyGUXPk3dYyIrYP0OPLKyLkAHaVb7yngCLFw7+TE1BLmLxjgizfGNnx7giBh0xWO
 6ys36j3ipuncbJrj/Z6oq4MggZUm0Gs85scWgqhJzE20Ql2f46mRLDEAwu8Lc/JQpB2n
 a0/AEFUIipOlg4GoUaKxbrY5CMNkRF0pp7OJL79GViQDUq2SOi3w1B10bosZiZb+sh6X
 ds7k3rG6UAeo3/QatZI8b68R2DdA7+0N1ZaLQRa4l91NLMWQXiru7O2pnro5yC8/BawJ Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bjk0epb2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 09:52:06 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 198DmoaK013412;
 Fri, 8 Oct 2021 09:52:06 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bjk0epb2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 09:52:06 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 198DgGxr028375;
 Fri, 8 Oct 2021 13:52:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3bhepdc0sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 13:52:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 198DkXdF50987514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Oct 2021 13:46:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48045A405F;
 Fri,  8 Oct 2021 13:52:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2776EA4062;
 Fri,  8 Oct 2021 13:51:59 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  8 Oct 2021 13:51:59 +0000 (GMT)
Date: Fri, 8 Oct 2021 15:51:56 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211008155156.626e78b5.pasic@linux.ibm.com>
In-Reply-To: <20211008085839-mutt-send-email-mst@kernel.org>
References: <20211008123422.1415577-1-pasic@linux.ibm.com>
 <20211008085839-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AwLL2TwiE5bb7sR5YjTQOfnp3HJWl-Nz
X-Proofpoint-ORIG-GUID: pXbbnkG0k_9qzQg33cFNFi_GxeNjjWsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_03,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110080081
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>, Xie Yongji <xieyongji@bytedance.com>,
 stefanha@redhat.com, Raphael Norwitz <raphael.norwitz@nutanix.com>
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

On Fri, 8 Oct 2021 09:05:03 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Oct 08, 2021 at 02:34:22PM +0200, Halil Pasic wrote:
> > The virtio specification virtio-v1.1-cs01 states: "Transitional devices
> > MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
> > been acknowledged by the driver."  This is exactly what QEMU as of 6.1
> > has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
> > 
> > However, the specification also says: "... the driver MAY read (but MUST
> > NOT write) the device-specific configuration fields to check that it can
> > support the device ..." before setting FEATURES_OK.
> > 
> > In that case, any transitional device relying solely on
> > VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
> > legacy format.  In particular, this implies that it is in big endian
> > format for big endian guests. This naturally confuses the driver which
> > expects little endian in the modern mode.
> > 
> > It is probably a good idea to amend the spec to clarify that
> > VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> > is complete. However, we already have a regression so let's try to address  
> 
> actually, regressions. and we can add 
> "since originally before validate callback existed
> config space was only read after
> FEATURES_OK. See Fixes tags for relevant commits"
> 
> > it.

How about replacing the paragraph above with the following?

"It is probably a good idea to amend the spec to clarify that
VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
is complete. Before validate callback existed, config space was only
read after FEATURES_OK. However, we already have two regression, so
let's address this here as well."
> > 
> > The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and
> > the VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when
> > virtio 1.0 is used on both sides. The latter renders virtio-blk
> > unusable with DASD backing, because things simply don't work with
> > the default.  

and add 
"See Fixes tags for relevant commits."
here.
> 
> Let's add a work around description now:
> 
> 
> For QEMU, we can work around the issue by writing out the features
> register with VIRTIO_F_VERSION_1 bit set.  We (ab) use the
s/features register/feature bits/
rationale: ccw does not have a features register, and qemu does not
really act as if its behavior was controlled by the values in a features
register. I.e. when we read the register we see VIRTIO_F_VERSION_!
because the feature is offered. In QEMU we basically read host_featues
but write the guest_features. And what drives device behavior is mostly
guest_features. 

s/(ab) use/(ab)use/

> finalize_features config op for this. It's not enough to address vhost

s/It's/This is/

> user and vhost block devices since these do not get the features until

s/vhost user and vhost block/some vhost-user and vhost-vdpa/ ?

Ratioale: I think vhost block is just a vhost-user device. On the other
hand vhost-user-fs works like charm because the config space is
implemented in qemu and not in the vhost-user device. I
didn't check vhost_net. I'm not even sure qemu offers a vhost_net
implementation. Anyway I wouldn't like to make any false statements here.

> FEATURES_OK, however it looks like these two actually never handled the
> endian-ness for legacy mode correctly, so at least that's not a
> regression.
> 
> No devices except virtio net and virtio blk seem to be affected.
> 
> Long term the right thing to do is to fix the hypervisors.
> 

Sounds good. Thanks! Are you OK with my changes proposed to your changes?

Regards,
Halil
> 
> > 
> > Cc: <stable@vger.kernel.org> #v4.11
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in
> > config space") Fixes: fe36cbe0671e ("virtio_net: clear MTU when out
> > of range") Reported-by: markver@us.ibm.com
> > ---
> >  drivers/virtio/virtio.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > index 0a5b54034d4b..236081afe9a2 100644
> > --- a/drivers/virtio/virtio.c
> > +++ b/drivers/virtio/virtio.c
> > @@ -239,6 +239,17 @@ static int virtio_dev_probe(struct device *_d)
> >  		driver_features_legacy = driver_features;
> >  	}
> >  
> > +	/*
> > +	 * Some devices detect legacy solely via F_VERSION_1. Write
> > +	 * F_VERSION_1 to force LE config space accesses before
> > FEATURES_OK for
> > +	 * these when needed.
> > +	 */
> > +	if (drv->validate && !virtio_legacy_is_little_endian()
> > +			  && device_features &
> > BIT_ULL(VIRTIO_F_VERSION_1)) {
> > +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> > +		dev->config->finalize_features(dev);
> > +	}
> > +
> >  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
> >  		dev->features = driver_features & device_features;
> >  	else
> > 
> > base-commit: 60a9483534ed0d99090a2ee1d4bb0b8179195f51
> > -- 
> > 2.25.1  
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
