Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFDD4047A7
	for <lists.virtualization@lfdr.de>; Thu,  9 Sep 2021 11:18:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624CD401C8;
	Thu,  9 Sep 2021 09:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FuOzRCDjdRvB; Thu,  9 Sep 2021 09:18:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4A494401D9;
	Thu,  9 Sep 2021 09:18:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D05AFC000D;
	Thu,  9 Sep 2021 09:18:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51BA0C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34110401D0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjAD1w61u_V3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:18:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25EA0401C8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631179108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Krg9n2n4lgxmyAY3a21a0zB1D/G0I7D/mxMTX6GAsu0=;
 b=TyPXTRSHe94X6YbqT9B4IEyLN57CuXHalZdYuYPjhrKX4t/Is+lusXqX6+LQcdEjA1BHzw
 bHLk1vkft3cV0egxV0xiVp4uZ0z/hHxuJMwTjaQyLcIzbCkmMKUdCKEXzKEmg3GSxDnm3Y
 JjquqVV2uxmyI0fkXGPJFMRc2D5DCAU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-FIgeUl9uNaGU-w7HjtKwAg-1; Thu, 09 Sep 2021 05:18:27 -0400
X-MC-Unique: FIgeUl9uNaGU-w7HjtKwAg-1
Received: by mail-wm1-f70.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so528616wml.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Sep 2021 02:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Krg9n2n4lgxmyAY3a21a0zB1D/G0I7D/mxMTX6GAsu0=;
 b=D9xLDVSZsCTgcgkU+NjrpC45pSBXZSTfzM4ssGsQXVH/QCzKqthXs3hczr+U/W+PPA
 uca0vPUswAy0t5BeWFYysSTqQgaCnFWsWa0/son0RKX4TB0U1xiWCgv8KGu6OlviokVd
 yllUe5qtG/LqczgsaLK7HY0+LQevfcEg/tBypYUsZIjOCTY0wDqr+uOpHqHJdKdC7jcc
 3LrAdv2+pbLra81qTftk1Y40VrLaN9rYD9X2dICs/Lk+LG9AR8f6uDXlTgu/V2ZFfJZY
 VcAjdJFz6C9O5nAUTs3sgs4fNCDpBFEY9E0m4/hfm9RZ4LfRPjOwnXxlKpScxMi5ewxD
 7AxA==
X-Gm-Message-State: AOAM532myEkE+u7XT21Dfj3GajoWkFzhTqVB6Kc0eneLZe4WgI/ObXRJ
 6YZKF0Favj16ZQC29RpdMDMYdwWckwHmZVWZRB8GiXdlid+czMFXIlpZ6K3x8ai3HRvV+u2GgF1
 CNF9sWlq4UgcxvdfNTi7chTstY1hhbAnO0nKbTLzumQ==
X-Received: by 2002:adf:ea90:: with SMTP id s16mr2310721wrm.235.1631179105917; 
 Thu, 09 Sep 2021 02:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFjAq21nDbpWPPjrbsJfaoxNYRTgyf2/ZBVzU5v/LEOsfI5v4OEI9flJnqQ6AXpadGjfF5Ug==
X-Received: by 2002:adf:ea90:: with SMTP id s16mr2310707wrm.235.1631179105696; 
 Thu, 09 Sep 2021 02:18:25 -0700 (PDT)
Received: from redhat.com (bzq-84-108-84-219.cablep.bezeqint.net.
 [84.108.84.219])
 by smtp.gmail.com with ESMTPSA id e8sm1263084wrc.96.2021.09.09.02.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 02:18:24 -0700 (PDT)
Date: Thu, 9 Sep 2021 05:18:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: add get_vq_num_unchangeable callback in
 vdpa_config_ops
Message-ID: <20210909051706-mutt-send-email-mst@kernel.org>
References: <cover.1631101392.git.wuzongyong@linux.alibaba.com>
 <ebd83066e3897aae63e4b02f8729a73dd09931c6.1631101392.git.wuzongyong@linux.alibaba.com>
 <CACGkMEtAZg+Nkx_1WJAP2=xQ6o6G9Vd=xYvFmR6YRp8vBg2Tqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtAZg+Nkx_1WJAP2=xQ6o6G9Vd=xYvFmR6YRp8vBg2Tqg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Thu, Sep 09, 2021 at 10:55:03AM +0800, Jason Wang wrote:
> On Wed, Sep 8, 2021 at 8:23 PM Wu Zongyong <wuzongyong@linux.alibaba.com> wrote:
> >
> > This new callback is used to indicate whether the vring size can be
> > change or not. It is useful when we have a legacy virtio pci device as
> > the vdpa device for there is no way to negotiate the vring num by the
> > specification.
> 
> So I'm not sure it's worth bothering. E.g what if we just fail
> VHOST_SET_VRING_NUM it the value doesn't match what hardware has?
> 
> Thanks

More importantly is there and actual plan for supporting
legacy devices? I don't think they currently work at a number
of levels.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
