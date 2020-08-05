Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1922E23CAFF
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:30:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65F918686A;
	Wed,  5 Aug 2020 13:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj9cw4OxiZjh; Wed,  5 Aug 2020 13:29:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D91548699B;
	Wed,  5 Aug 2020 13:29:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD824C004C;
	Wed,  5 Aug 2020 13:29:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27653C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2322B85F19
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gV9p8ISIg5YR
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:29:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B94685E79
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596634195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bM6BX5L4/TWGWo6Fw0MECvbQOerPg7X6HOlNI1yptJk=;
 b=Z7cnq/vyPMkF/EJ0TR9h3iACPePaB6flZFsXVwQUVdtXRJtP5LGTrBkxrGWkSsqXhxv0oE
 2tBfDzGHef5k07XSvDYmo7DtXSGmMKs4QNyjdOTOd8xsG1TniMHwXGIfQG37cGwFgeuD4n
 AdP8J4r/svxqo4P1yVtQGvL4GGjwb9k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Wjp2JeM6MK-j9V7pVwjBlQ-1; Wed, 05 Aug 2020 09:29:53 -0400
X-MC-Unique: Wjp2JeM6MK-j9V7pVwjBlQ-1
Received: by mail-wr1-f70.google.com with SMTP id f7so13569566wrs.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bM6BX5L4/TWGWo6Fw0MECvbQOerPg7X6HOlNI1yptJk=;
 b=gnODa/V9lNFk781GqVwt0pxLflvKIqKE4myDrdC4kG42vYl36s3EwGhwwurUZ8kDmb
 mO/CtkT21779tOuCEmg3vvbWwEohw6g7xfdbjVXQXoORa001gS1paH/uu9JPCkOh2QuR
 715yQwdHS1U0kNPxLp8pbFIHppSDU8el9OACYSLxsFnF1JRR8kuU4ZXjc51LJQIJWMAU
 w3qcU8a5OiN0NP9VuuiarQcG2CHetETRzM4AwnmPH+l2bStwkPzTXAAuYN2MoobFTnwr
 jSMzZn4ErwO0FxwmzSK4lZcQat9pS/oi+64s8asY6nP5Lkfv670MzlB9/rrCwK05nF6S
 PL2Q==
X-Gm-Message-State: AOAM533dHsQnEX6Mcz8zc2HxTVUND7p56BG5kW4LVlE58iy+MUpFG3SL
 A9yVx7XFQIR+Z5FAFq2D8nZqBUTSuWgjA7Jj9WFRduggVPn3LLaJwWwO4xvnt+eO1l1odL2Pmgc
 Y6Qq5e0ut/6uoIHKlu7oxRiaayqQ08pCGWWIKcPPK0A==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr2729022wrr.353.1596634191933; 
 Wed, 05 Aug 2020 06:29:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD71GjrxuIPt/70247PjYqetL3L7dJwS2itOOTaj8djrdCVByKfXCsWH/un1uLPcWYOq4+WA==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr2729006wrr.353.1596634191720; 
 Wed, 05 Aug 2020 06:29:51 -0700 (PDT)
Received: from redhat.com (bzq-79-178-123-8.red.bezeqint.net. [79.178.123.8])
 by smtp.gmail.com with ESMTPSA id
 q2sm2752486wro.8.2020.08.05.06.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:29:51 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:29:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 17/24] virtio_config: disallow native type fields
Message-ID: <20200805092923-mutt-send-email-mst@kernel.org>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-18-mst@redhat.com>
 <20200804165039.58dcb29e.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200804165039.58dcb29e.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, Aug 04, 2020 at 04:50:39PM +0200, Cornelia Huck wrote:
> On Mon, 3 Aug 2020 16:59:57 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > Transitional devices should all use __virtioXX types.
> 
> I think they should use __leXX for those fields that are not present
> with legacy devices?

Will correct.

> > Modern ones should use __leXX.
> > _uXX type would be a bug.
> > Let's prevent that.
> 
> That sounds right, though.
> 
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/linux/virtio_config.h | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> > index 64da491936f7..c68f58f3bf34 100644
> > --- a/include/linux/virtio_config.h
> > +++ b/include/linux/virtio_config.h
> > @@ -319,9 +319,8 @@ static inline __virtio64 cpu_to_virtio64(struct virtio_device *vdev, u64 val)
> >  	__virtio_pick_type(x, __u8, __u8,					\
> >  		__virtio_pick_endian(x, __virtio16, __virtio32, __virtio64,	\
> >  			__virtio_pick_endian(x, __le16, __le32, __le64,		\
> > -				__virtio_pick_endian(x, __u16, __u32, __u64,	\
> > -					/* No other type allowed */		\
> > -					(void)0)))))
> > +				/* No other type allowed */			\
> > +				(void)0))))
> >  
> >  #endif
> >  

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
