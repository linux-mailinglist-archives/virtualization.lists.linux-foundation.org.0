Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D74BC4047D1
	for <lists.virtualization@lfdr.de>; Thu,  9 Sep 2021 11:32:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 285A340563;
	Thu,  9 Sep 2021 09:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uiXfd1AnAHz0; Thu,  9 Sep 2021 09:32:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C471F40185;
	Thu,  9 Sep 2021 09:32:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DB38C000D;
	Thu,  9 Sep 2021 09:32:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3240C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95549849B0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBwm0EsA1RYO
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:32:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5D3080DD0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631179953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l6oxYI9ut8npw7lFLZ/z3EUqhsCOkpfGiXzm3CrP2Pc=;
 b=hx8ktJsYHfshQC0D+JvZytQIVzVKJgiRIRKF2vk/Vhwzv40gxVeHHiVqGfkDSVuw5vRjff
 bw24jIqwaZMS/ImmOZeujXb8di+EFSnYIxRAonqT1D3pR8xnMBxB/VRhJUIsqCkC91yldT
 XGOikG1iOjW1+LoDY0zjtb+VkOZ7HCg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-KmPPBu7lN1Gvxq3Ls_fZpg-1; Thu, 09 Sep 2021 05:32:32 -0400
X-MC-Unique: KmPPBu7lN1Gvxq3Ls_fZpg-1
Received: by mail-lf1-f70.google.com with SMTP id
 bp18-20020a056512159200b003eb84833c98so500581lfb.14
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Sep 2021 02:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6oxYI9ut8npw7lFLZ/z3EUqhsCOkpfGiXzm3CrP2Pc=;
 b=lIGjU3tfg8rXJh7tI87Sy1rLlkiK1aO9BbSs2APOaYBT9Tj/Xp3TYqUN0Ze/Sab7hO
 xjT5oEQGs73xvGlHVvLTMYg6/sQDc9D5IEETosK3rMLDnbFZIzHlmF3TR1gePolZRGvX
 CMH6MOJNx/uY51uRbJuqLJlvfFgr1Y7xo56eVQ+MfXWNNlZfUPG5eJNZ53fCXDoV04+X
 OmBDb8WmS0ON+JnIagb7qtXX5XkuMNDgU5LUualyFoFmVGJ3L0pZ3Os5ijU5fk3/rQyV
 FdDD9mwgLberfx518nDXLSMFhXq666Z8xVjAdSRJ639q6HAAEf/wZjtt+n3Kq8jY2FlM
 7Tow==
X-Gm-Message-State: AOAM533vnqvjPvAsxIcuege6yrzuL9/U6pCsmm8n22oGaOMnvdgfay70
 nDIFa8m4ylHWNIF7Xy9LuFf9G+ivqWvhrTuWsT2bxt7We+vGFNPN7a1EoCaP3kSLGHvzU7Rw8hn
 2sYxkCbiq11ITL+q621bDLP1Hq/WSWeQbJPSbyk7solcxRTv5TeAF6EaDEg==
X-Received: by 2002:a05:6512:2001:: with SMTP id
 a1mr1631115lfb.498.1631179950932; 
 Thu, 09 Sep 2021 02:32:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl0hlu0tmaQ2CMyDCL+WTPdOq32+SzUOb2yeoKq+vIsS1TTq4pXoe92IahEto4NDmVJCxLKpcU5CL4QNu/9Hg=
X-Received: by 2002:a05:6512:2001:: with SMTP id
 a1mr1631107lfb.498.1631179950780; 
 Thu, 09 Sep 2021 02:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631101392.git.wuzongyong@linux.alibaba.com>
 <ebd83066e3897aae63e4b02f8729a73dd09931c6.1631101392.git.wuzongyong@linux.alibaba.com>
 <CACGkMEtAZg+Nkx_1WJAP2=xQ6o6G9Vd=xYvFmR6YRp8vBg2Tqg@mail.gmail.com>
 <20210909051706-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210909051706-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Sep 2021 17:32:20 +0800
Message-ID: <CACGkMEuSX6McCf2hcZJNKVj_1errDQGN9uPGhYWo55fsB5NKBw@mail.gmail.com>
Subject: Re: [PATCH 5/6] vdpa: add get_vq_num_unchangeable callback in
 vdpa_config_ops
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: wei.yang1@linux.alibaba.com, Wu Zongyong <wuzongyong@linux.alibaba.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>
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

On Thu, Sep 9, 2021 at 5:18 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Sep 09, 2021 at 10:55:03AM +0800, Jason Wang wrote:
> > On Wed, Sep 8, 2021 at 8:23 PM Wu Zongyong <wuzongyong@linux.alibaba.com> wrote:
> > >
> > > This new callback is used to indicate whether the vring size can be
> > > change or not. It is useful when we have a legacy virtio pci device as
> > > the vdpa device for there is no way to negotiate the vring num by the
> > > specification.
> >
> > So I'm not sure it's worth bothering. E.g what if we just fail
> > VHOST_SET_VRING_NUM it the value doesn't match what hardware has?
> >
> > Thanks
>
> More importantly is there and actual plan for supporting
> legacy devices? I don't think they currently work at a number
> of levels.

I think the answer is no, it would introduce a lot of burdens.

Thanks

>
> --
> MST
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
