Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5741FBA7
	for <lists.virtualization@lfdr.de>; Sat,  2 Oct 2021 14:09:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4877541612;
	Sat,  2 Oct 2021 12:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPHJPIig2tA9; Sat,  2 Oct 2021 12:09:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D0989415B7;
	Sat,  2 Oct 2021 12:09:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55DE9C0022;
	Sat,  2 Oct 2021 12:09:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 080A7C000D
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Oct 2021 12:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC32740245
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Oct 2021 12:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Voe9yBDBVQ4p
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Oct 2021 12:09:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34DCA4021B
 for <virtualization@lists.linux-foundation.org>;
 Sat,  2 Oct 2021 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633176570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/l7+0a5Dc1Aijj3yF6yBWlmwwsTZcgNOfg/nDpXLfXA=;
 b=CroQ0Q5Tc5Ojsb6YQuYQ/DFTgPpUfQJ3HugBJj/0JM9f8SGwQQNqd4RQfZAjUem603ZmFC
 5yrm6oGbKd4BYK1BkYKOXiCubz6OwnvrOl7VkMOzNkr5japoNjNTIbBsyjCASShymhWrAG
 i/2Nrnx5RPVQnjkWU5uTsKtgymuQ/kM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-BEGMSt1zO4iYL6VWMUrxxw-1; Sat, 02 Oct 2021 08:09:26 -0400
X-MC-Unique: BEGMSt1zO4iYL6VWMUrxxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p63-20020a1c2942000000b0030ccf0767baso7285937wmp.6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 02 Oct 2021 05:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/l7+0a5Dc1Aijj3yF6yBWlmwwsTZcgNOfg/nDpXLfXA=;
 b=obLlfb3FJOy5puZmrYXrei2bc+a7sUOxs8qnE9/bUM1rVdsj1EPDQBhoNPybri+NUG
 a+LALUSSbFDvyW04l3Rn17sxWN06g1sJRaJbyDeBIpvDyh1AqxSwLlVyfOZ6wqqfKEa0
 PyLYd1ttDlv4WbxeEawgIyVa5JDEuA8/PMa4AOV1DwQNRfte3q35ikdc3D37KukDQUbV
 BsGEHXto0jWeP0+pXeVUvZIoRBwdk+qGrweMdjF5C0S6OTDO23NBg1Snpw4XEI7y2rZ0
 Vp+tVCmvw0J4WkTW/zdFkDfJ/FKou/SmAWZhdUuFiJ0hFTlu+TpOeF6ZSIueO0ffAIaW
 YNnw==
X-Gm-Message-State: AOAM530xChvZqoBTtfey/PMCAOXTo9LL/1G7nzOl1Q8/2NW7b3C9tmMn
 mTXh6Icy8t9ikecO39mBzZolfh5mDnFqDaB859cZrHTM9OMn4WmzRyPoJFHwF/s7Oqiqj6HE8Ns
 IZeuzo650YVBaHuhPTA3k6T1Ev8WygqdYksq2b4Kllw==
X-Received: by 2002:adf:a501:: with SMTP id i1mr3165420wrb.184.1633176565022; 
 Sat, 02 Oct 2021 05:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw38kfx3fxrscY8VHyOvNaEHcZggBOMmzmqc53e9zPq8Vw2+DVJj5c2u+5vTedBvpWiBw0D+A==
X-Received: by 2002:adf:a501:: with SMTP id i1mr3165397wrb.184.1633176564766; 
 Sat, 02 Oct 2021 05:09:24 -0700 (PDT)
Received: from redhat.com ([2.55.22.213])
 by smtp.gmail.com with ESMTPSA id c9sm11040352wmb.41.2021.10.02.05.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:09:24 -0700 (PDT)
Date: Sat, 2 Oct 2021 08:09:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211002062331-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <87r1d64dl4.fsf@redhat.com>
 <20210930130350.0cdc7c65.pasic@linux.ibm.com>
 <87ilyi47wn.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87ilyi47wn.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>
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

On Thu, Sep 30, 2021 at 01:31:04PM +0200, Cornelia Huck wrote:
> On Thu, Sep 30 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Thu, 30 Sep 2021 11:28:23 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >
> >> On Thu, Sep 30 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> >> 
> >> > This patch fixes a regression introduced by commit 82e89ea077b9
> >> > ("virtio-blk: Add validation for block size in config space") and
> >> > enables similar checks in verify() on big endian platforms.
> >> >
> >> > The problem with checking multi-byte config fields in the verify
> >> > callback, on big endian platforms, and with a possibly transitional
> >> > device is the following. The verify() callback is called between
> >> > config->get_features() and virtio_finalize_features(). That we have a
> >> > device that offered F_VERSION_1 then we have the following options
> >> > either the device is transitional, and then it has to present the legacy
> >> > interface, i.e. a big endian config space until F_VERSION_1 is
> >> > negotiated, or we have a non-transitional device, which makes
> >> > F_VERSION_1 mandatory, and only implements the non-legacy interface and
> >> > thus presents a little endian config space. Because at this point we
> >> > can't know if the device is transitional or non-transitional, we can't
> >> > know do we need to byte swap or not.
> >> >
> >> > The virtio spec explicitly states that the driver MAY read config
> >> > between reading and writing the features so saying that first accessing
> >> > the config before feature negotiation is done is not an option. The
> >> > specification ain't clear about setting the features multiple times
> >> > before FEATURES_OK, so I guess that should be fine.
> >> >
> >> > I don't consider this patch super clean, but frankly I don't think we
> >> > have a ton of options. Another option that may or man not be cleaner,
> >> > but is also IMHO much uglier is to figure out whether the device is
> >> > transitional by rejecting _F_VERSION_1, then resetting it and proceeding
> >> > according tho what we have figured out, hoping that the characteristics
> >> > of the device didn't change.
> >> >
> >> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >> > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> >> > Reported-by: markver@us.ibm.com
> >> > ---
> >> >  drivers/virtio/virtio.c | 4 ++++
> >> >  1 file changed, 4 insertions(+)
> >> >
> >> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> >> > index 0a5b54034d4b..9dc3cfa17b1c 100644
> >> > --- a/drivers/virtio/virtio.c
> >> > +++ b/drivers/virtio/virtio.c
> >> > @@ -249,6 +249,10 @@ static int virtio_dev_probe(struct device *_d)
> >> >  		if (device_features & (1ULL << i))
> >> >  			__virtio_set_bit(dev, i);
> >> >  
> >> > +	/* Write back features before validate to know endianness */
> >> > +	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
> >> > +		dev->config->finalize_features(dev);  
> >> 
> >> This really looks like a mess :(
> >> 
> >> We end up calling ->finalize_features twice: once before ->validate, and
> >> once after, that time with the complete song and dance. The first time,
> >> we operate on one feature set; after validation, we operate on another,
> >> and there might be interdependencies between the two (like a that a bit
> >> is cleared because of another bit, which would not happen if validate
> >> had a chance to clear that bit before).
> >
> > Basically the second set is a subset of the first set.
> 
> I don't think that's clear.
> 
> >
> >> 
> >> I'm not sure whether that is even a problem in the spec: while the
> >> driver may read the config before finally accepting features
> >
> > I'm not sure I'm following you. Let me please qoute the specification:
> > """
> > 4. Read device feature bits, and write the subset of feature bits
> > understood by the OS and driver to the device. During this step the driver MAY read (but MUST NOT write) the device-specific configuration fields to check that it can support the device before accepting it. 
> > 5. Set the FEATURES_OK status bit. The driver MUST NOT accept new feature bits after this step. 
> > """
> > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-930001
> 
> Yes, exactly, it MAY read before accepting features. How does the device
> know whether the config space is little-endian or not?

I think it knows simply because the spec says it's little-endian.



> >
> >> , it does
> >> not really make sense to do so before a feature bit as basic as
> >> VERSION_1 which determines the endianness has been negotiated. 
> >
> > Are you suggesting that ->verify() should be after
> > virtio_finalize_features()?
> 
> No, that would defeat the entire purpose of verify. After
> virtio_finalize_features(), we are done with feature negotiation.
> 
> > Wouldn't
> > that mean that verify() can't reject feature bits? But that is the whole
> > point of commit 82e89ea077b9 ("virtio-blk: Add validation for block size
> > in config space"). Do you think that the commit in question is
> > conceptually flawed? My understanding of the verify is, that it is supposed
> > to fence features and feature bits we can't support, e.g. because of
> > config space things, but I may be wrong.
> 
> No, that commit is not really flawed on its own, I think the whole
> procedure may be problematic.
> 
> >
> > The trouble is, feature bits are not negotiated one by one, but basically all
> > at once. I suppose, I did the next best thing to first negotiating
> > VERSION_1.
> 
> We probably need to special-case VERSION_1 to move at least forward;
> i.e. proceed as if we accepted it when reading the config space.
> 
> The problem is that we do not know what the device assumes when we read
> the config space prior to setting FEATURES_OK. It may assume
> little-endian if it offered VERSION_1, or it may not. The spec does not
> really say what happens before feature negotiation has finished.


So if your device is non transitional then it's LE.
If it's transitional it exposes a legacy interface
in addition to the modern one, and that one is guest endian.
How does device know which interface is used?
E.g. for PCI it's a separate address range.

For ccw why not check the revision? legacy drivers use 0 for that.


> >
> >
> >> For
> >> VERSION_1, we can probably go ahead and just assume that we will accept
> >> it if offered, but what about other (future) bits?
> >
> > I don't quite understand.
> 
> There might be other bits in the future that change how the config space
> works. We cannot assume that any of those bits will be accepted if
> offered; i.e. we need a special hack for VERSION_1.
> 
> >
> > Anyway, how do you think we should solve this problem?
> 
> This is a mess. For starters, we need to think about if we should do
> something in the spec, and if yes, what.. Then, we can probably think
> about how to implement that properly.
> 
> As we have an error right now that is basically a regression, we
> probably need a band-aid to keep going. Not sure if your patch is the
> right approach, maybe we really need to special-case VERSION_1 (the
> "assume we accepted it" hack mentioned above.) This will likely fix the
> reported problem (I assume that is s390x on QEMU); do we know about
> other VMMs? Any other big-endian architectures?
> 
> Anyone have any better suggestions?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
