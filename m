Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D8426D43
	for <lists.virtualization@lfdr.de>; Fri,  8 Oct 2021 17:08:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747C88429F;
	Fri,  8 Oct 2021 15:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-u5AV5DOcCu; Fri,  8 Oct 2021 15:08:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2847F84091;
	Fri,  8 Oct 2021 15:08:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1CBDC0022;
	Fri,  8 Oct 2021 15:08:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BEAAC000D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 15:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB5161014
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 15:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSwSHEsgO4nf
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 15:08:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB7861013
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Oct 2021 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633705726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUCyJf0CD/kcfrq7C8GdCqWYBNHc0A3utB2YFlkZ+S0=;
 b=EXIkvoZbUDjt0SdLXAwf6457T0L3GHlHF0C7MfPrWe4euWw4CsMoWotWD5zopiCd3zopgo
 zt+VCsTBleqheYvQeoqVcjrT5wCS8GPptYDZI6zv/14cgbd3tN47eWrGlJzs66/5cJnaxk
 FP1JSPEqyNvXTm55WZg8VrAwnFPXjDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-Q5UmhENRNISgc1ByGcD4Ig-1; Fri, 08 Oct 2021 11:08:45 -0400
X-MC-Unique: Q5UmhENRNISgc1ByGcD4Ig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48617814615;
 Fri,  8 Oct 2021 15:08:37 +0000 (UTC)
Received: from localhost (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CBE65BAF4;
 Fri,  8 Oct 2021 15:08:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/1] virtio: write back F_VERSION_1 before validate
In-Reply-To: <20211008155156.626e78b5.pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211008123422.1415577-1-pasic@linux.ibm.com>
 <20211008085839-mutt-send-email-mst@kernel.org>
 <20211008155156.626e78b5.pasic@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 08 Oct 2021 17:08:11 +0200
Message-ID: <87ily7y2p0.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
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

On Fri, Oct 08 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Fri, 8 Oct 2021 09:05:03 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
>> On Fri, Oct 08, 2021 at 02:34:22PM +0200, Halil Pasic wrote:
>> > The virtio specification virtio-v1.1-cs01 states: "Transitional devices
>> > MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
>> > been acknowledged by the driver."  This is exactly what QEMU as of 6.1
>> > has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
>> > 
>> > However, the specification also says: "... the driver MAY read (but MUST
>> > NOT write) the device-specific configuration fields to check that it can
>> > support the device ..." before setting FEATURES_OK.
>> > 
>> > In that case, any transitional device relying solely on
>> > VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
>> > legacy format.  In particular, this implies that it is in big endian
>> > format for big endian guests. This naturally confuses the driver which
>> > expects little endian in the modern mode.
>> > 
>> > It is probably a good idea to amend the spec to clarify that
>> > VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
>> > is complete. However, we already have a regression so let's try to address  
>> 
>> actually, regressions. and we can add 
>> "since originally before validate callback existed
>> config space was only read after
>> FEATURES_OK. See Fixes tags for relevant commits"
>> 
>> > it.
>
> How about replacing the paragraph above with the following?
>
> "It is probably a good idea to amend the spec to clarify that
> VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> is complete. Before validate callback existed, config space was only
> read after FEATURES_OK. However, we already have two regression, so
> let's address this here as well."
>> > 
>> > The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and
>> > the VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when
>> > virtio 1.0 is used on both sides. The latter renders virtio-blk
>> > unusable with DASD backing, because things simply don't work with
>> > the default.  
>
> and add 
> "See Fixes tags for relevant commits."
> here.
>> 
>> Let's add a work around description now:
>> 
>> 
>> For QEMU, we can work around the issue by writing out the features
>> register with VIRTIO_F_VERSION_1 bit set.  We (ab) use the
> s/features register/feature bits/
> rationale: ccw does not have a features register, and qemu does not
> really act as if its behavior was controlled by the values in a features
> register. I.e. when we read the register we see VIRTIO_F_VERSION_!
> because the feature is offered. In QEMU we basically read host_featues
> but write the guest_features. And what drives device behavior is mostly
> guest_features. 
>
> s/(ab) use/(ab)use/
>
>> finalize_features config op for this. It's not enough to address vhost
>
> s/It's/This is/
>
>> user and vhost block devices since these do not get the features until
>
> s/vhost user and vhost block/some vhost-user and vhost-vdpa/ ?
>
> Ratioale: I think vhost block is just a vhost-user device. On the other
> hand vhost-user-fs works like charm because the config space is
> implemented in qemu and not in the vhost-user device. I
> didn't check vhost_net. I'm not even sure qemu offers a vhost_net
> implementation. Anyway I wouldn't like to make any false statements here.
>
>> FEATURES_OK, however it looks like these two actually never handled the
>> endian-ness for legacy mode correctly, so at least that's not a
>> regression.
>> 
>> No devices except virtio net and virtio blk seem to be affected.
>> 
>> Long term the right thing to do is to fix the hypervisors.
>> 
>
> Sounds good. Thanks! Are you OK with my changes proposed to your changes?
>
> Regards,
> Halil
>> 
>> > 
>> > Cc: <stable@vger.kernel.org> #v4.11
>> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>> > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in
>> > config space") Fixes: fe36cbe0671e ("virtio_net: clear MTU when out
>> > of range") Reported-by: markver@us.ibm.com
>> > ---
>> >  drivers/virtio/virtio.c | 11 +++++++++++
>> >  1 file changed, 11 insertions(+)
>> > 
>> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>> > index 0a5b54034d4b..236081afe9a2 100644
>> > --- a/drivers/virtio/virtio.c
>> > +++ b/drivers/virtio/virtio.c
>> > @@ -239,6 +239,17 @@ static int virtio_dev_probe(struct device *_d)
>> >  		driver_features_legacy = driver_features;
>> >  	}
>> >  
>> > +	/*
>> > +	 * Some devices detect legacy solely via F_VERSION_1. Write
>> > +	 * F_VERSION_1 to force LE config space accesses before
>> > FEATURES_OK for
>> > +	 * these when needed.
>> > +	 */
>> > +	if (drv->validate && !virtio_legacy_is_little_endian()
>> > +			  && device_features &
>> > BIT_ULL(VIRTIO_F_VERSION_1)) {
>> > +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
>> > +		dev->config->finalize_features(dev);
>> > +	}
>> > +
>> >  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
>> >  		dev->features = driver_features & device_features;
>> >  	else
>> > 
>> > base-commit: 60a9483534ed0d99090a2ee1d4bb0b8179195f51

FWIW, with the amends:

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
