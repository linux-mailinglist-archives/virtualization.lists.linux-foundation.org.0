Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DD751122E42
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 15:14:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8ABA686824;
	Tue, 17 Dec 2019 14:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1lV-aZ+85LC; Tue, 17 Dec 2019 14:14:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8899E8680D;
	Tue, 17 Dec 2019 14:14:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A8A3C077D;
	Tue, 17 Dec 2019 14:14:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22626C077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 14:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1EC6E87941
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 14:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnbFUQ4RiiJV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 14:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5DADC8753D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576592079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SY58caI5TLKbnWwXT+jPR9AjCPIq86Ged620sgP1Ol0=;
 b=cyXgwheZug8yJBmqHk1kodFErTxG4ePl5fOYB6ngdTrxE40qe2AZwozc28HBhxyx1cl30Y
 8BQn9HNxAZ2WayXe63d0Swqg/FN5lKyHlarrlONSdLn89alPHBBg3uL5Mf1HVYvBigSiNc
 Iyrop5hFOmp149KeI+sFvaUK5D1s0vg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-B9aGbZ1mNI-Avh1Ofvix1g-1; Tue, 17 Dec 2019 09:14:36 -0500
Received: by mail-qk1-f198.google.com with SMTP id f124so6632376qkb.22
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 06:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SY58caI5TLKbnWwXT+jPR9AjCPIq86Ged620sgP1Ol0=;
 b=FjA/Zl9ooYm27HRRJreJ1U2v7b76eEvs5grhrb0FcwKc+uCE8ppSWV0SVNZzO0W/Lb
 KJjn05Q3MqrKfOwHPcoQh7lklwSydv2YLpgv2RU9SOhBRNkhfLUnxCcwBHn8Bz5o0Ski
 oELyCj1FTS4QwKMgTZGrJF4tmh1Gc5zb04Jr7smegtJ68Gr4fLksJFK/BskAIP8hyWH0
 RflUyBE9nO2OeSwkxx2eT4LvX7Gd2/ajaNZRRvYoMsNQvyPWF5K3Es/C9dpSM1CypyfQ
 52LftEBhc+GAxl9DiKT+2BeVQpZq3xfjJgnFvD+YGnGSSB4NgaAzPkmjm3OY/y9i+yJp
 L4Cw==
X-Gm-Message-State: APjAAAW2I2195U9uZWSY3vf1o4aYPy5sc4+z06kFOuEvp4WkSQIQ0pNp
 g3PXcTl7ZFz/dlGNVpI3zQxTJaH0JqjJuIu3YuvNIel5+NWkRJ4u7CUI75jZSFoJ+b8hd4XORpF
 x80S6+DVrHlqoZw57QIN8t0yphWfnv/JnZSp0eBRYqg==
X-Received: by 2002:a0c:d6c8:: with SMTP id l8mr4889456qvi.44.1576592076408;
 Tue, 17 Dec 2019 06:14:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzvv4MRkl35PLvoc/RFg8ghYXxVVjkQoS3CXrZkZiu/lSMuhzCbedu2V7mWZwcYMqwYPIong==
X-Received: by 2002:a0c:d6c8:: with SMTP id l8mr4889433qvi.44.1576592076176;
 Tue, 17 Dec 2019 06:14:36 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id v125sm7106330qka.47.2019.12.17.06.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 06:14:35 -0800 (PST)
Date: Tue, 17 Dec 2019 09:14:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-balloon: request nvqs based on features
Message-ID: <20191217091117-mutt-send-email-mst@kernel.org>
References: <20191216231429.38202-1-dverkamp@chromium.org>
 <20191217101108.7bf5018d.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191217101108.7bf5018d.cohuck@redhat.com>
X-MC-Unique: B9aGbZ1mNI-Avh1Ofvix1g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Liang Li <liang.z.li@intel.com>, virtualization@lists.linux-foundation.org
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

On Tue, Dec 17, 2019 at 10:11:08AM +0100, Cornelia Huck wrote:
> On Mon, 16 Dec 2019 15:14:29 -0800
> Daniel Verkamp <dverkamp@chromium.org> wrote:
> 
> > After 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT"),
> > the virtio-balloon device unconditionally specifies 4 virtqueues as the
> > argument to find_vqs(), which means that 5 MSI-X vectors are required in
> > order to assign one vector per VQ plus one for configuration changes.
> > 
> > However, in cases where the virtio device only provides exactly as many
> > MSI-X vectors as required for the features it implements (e.g. 3 for the
> > basic configuration of inflate + deflate + config), this results in the
> > selection of the fallback configuration where one interrupt vector is
> > used for all VQs instead of having one VQ per vector.
> > 
> > Restore the logic that chose nvqs conditionally based on enabled
> > features, which was removed as part of the aforementioned commit.
> > This is slightly more complex than just incrementing a counter of the
> > number of VQs, since the queue for a given feature is assigned a fixed
> > index.
> 
> As Wei already said, this should not be necessary, but see below.
> 
> > 
> > Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> > ---
> >  drivers/virtio/virtio_balloon.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > index 93f995f6cf36..67c6318d77c7 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -465,6 +465,7 @@ static int init_vqs(struct virtio_balloon *vb)
> >  	vq_callback_t *callbacks[VIRTIO_BALLOON_VQ_MAX];
> >  	const char *names[VIRTIO_BALLOON_VQ_MAX];
> >  	int err;
> > +	unsigned nvqs;
> >  
> >  	/*
> >  	 * Inflateq and deflateq are used unconditionally. The names[]
> > @@ -475,20 +476,24 @@ static int init_vqs(struct virtio_balloon *vb)
> >  	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
> >  	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
> >  	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
> > +	nvqs = VIRTIO_BALLOON_VQ_DEFLATE + 1;
> > +
> >  	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
> >  	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
> 
> Note that we set names[q] to NULL, but not callbacks[q].
> 
> >  
> >  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
> >  		names[VIRTIO_BALLOON_VQ_STATS] = "stats";
> >  		callbacks[VIRTIO_BALLOON_VQ_STATS] = stats_request;
> > +		nvqs = VIRTIO_BALLOON_VQ_STATS + 1;
> >  	}
> >  
> >  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
> >  		names[VIRTIO_BALLOON_VQ_FREE_PAGE] = "free_page_vq";
> >  		callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
> > +		nvqs = VIRTIO_BALLOON_VQ_FREE_PAGE + 1;
> >  	}
> >  
> > -	err = vb->vdev->config->find_vqs(vb->vdev, VIRTIO_BALLOON_VQ_MAX,
> > +	err = vb->vdev->config->find_vqs(vb->vdev, nvqs,
> >  					 vqs, callbacks, names, NULL, NULL);
> 
> This will end up in vp_find_vqs_msix() eventually, which will try to
> determine the number of needed vectors based upon whether callbacks[q]
> is !NULL. That's probably the reason you end up trying to use more
> vectors than needed. (Further down in that function, the code will skip
> any queue with names[q] == NULL, but that's too late for determining
> the number of vectors.)
> So I think that either (a) virtio-pci should avoid trying to allocate a
> vector for queues with names[q] == NULL, or (b) virtio-balloon should
> clean out callbacks[q] for unused queues as well. Maybe both?
> 
> >  	if (err)
> >  		return err;

I'm inclined to either do a or both.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
