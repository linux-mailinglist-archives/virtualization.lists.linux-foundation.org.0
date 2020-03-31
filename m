Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D70919970F
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 15:11:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E418C88793;
	Tue, 31 Mar 2020 13:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZqrlDsQxRvw; Tue, 31 Mar 2020 13:11:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4B34B8878C;
	Tue, 31 Mar 2020 13:11:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D513C07FF;
	Tue, 31 Mar 2020 13:11:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA98BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D366C85EC6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CL2MW5NRCdHH
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:11:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E63FB8594B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585660281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usxsvV26fFHRpbo4EPS+A1tC2Knjsvias64PeyQykb4=;
 b=Pd09aNRTx7XGxXwLZinva4uei/9KO9yr+ZPN6NPcR3yLO9VcctJOMkfSUNUnO90XnsXe9T
 KPZ1BizpFU+fGphUof5mKic84Vuuwa6Yl/KxHvCUf1x6DqCMf6u4pJoAd1Te6HMTAWcXs8
 9sN524PCtu1Ht1ENULAuSUfLvWja69A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-iKw_-DR8O4eHK_FExuTa2A-1; Tue, 31 Mar 2020 09:11:19 -0400
X-MC-Unique: iKw_-DR8O4eHK_FExuTa2A-1
Received: by mail-wm1-f72.google.com with SMTP id w9so681715wmi.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=usxsvV26fFHRpbo4EPS+A1tC2Knjsvias64PeyQykb4=;
 b=hQra5/yG8fwkNG/okWO/+Pxdgyeij5FagE+1ryTtF1kyUmfY3veFDxt33BxYQvbjux
 H52rK6EVuH0yVGlwQ00yOGr2MkYPlLH1ZVIrRIJwE+6b5IYPfRvJCz5XHYTjVP5tJHPN
 divncBsoDCxE2e0Yj5KmTF/0B1N5tkROm0CSGnUH+TJqxVN06lV9HTfeti2GdTEAaGs0
 ZPm6LmsTFxbwZbBNqzwZ4HDlXjfiB6S6LMy/tzbGDENPj0afX8nKJ9WgQq4jBe6fsVRy
 ALg4g1qpdtAZTHWVQ1j4rPUnTZhgVj9PDVUqmhP6XRQ/fa8fghtYXMm4FP2s/XaERRqM
 XmVg==
X-Gm-Message-State: ANhLgQ2Bv1g3mbqqRS0UlWft0pKG9cjLsfEpLzGHRBVddxBYQFusDK/l
 czdxYkDorUsdYkwIT4+LpJvY1y8D46BrzNHbLgSfYMPE5BpRHuK+o8NEZ+bOZdKuz3vgoXJdO1+
 lUtAmJnBYK4czfP1zVd7oW8+Ss+C/wrDlSr89jvgFgA==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr19523929wrq.47.1585660278620; 
 Tue, 31 Mar 2020 06:11:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vttjf+fvsMP8RlVLnva+uKSJYXT4yC5ZNHvDRMtCn+D/13PEya9eLPWLqUf0IcUzgcQvmLXLA==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr19523917wrq.47.1585660278456; 
 Tue, 31 Mar 2020 06:11:18 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id n2sm28031408wro.25.2020.03.31.06.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 06:11:12 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:11:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 30 (vhost)
Message-ID: <20200331085955-mutt-send-email-mst@kernel.org>
References: <20200330204307.669bbb4d@canb.auug.org.au>
 <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
MIME-Version: 1.0
In-Reply-To: <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Mon, Mar 30, 2020 at 10:22:22AM -0700, Randy Dunlap wrote:
> On 3/30/20 2:43 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The merge window has opened, so please do not add any material for the
> > next release into your linux-next included trees/branches until after
> > the merge window closes.
> > 
> > Changes since 20200327:
> > 
> > The vhost tree gained a conflict against the kvm-arm tree.
> > 
> 
> (note: today's linux-next is on 5.6-rc7.)
> 
> on x86_64:
> 
> # CONFIG_EVENTFD is not set

Oh, this is Jason's Kconfig refactoring. Vhost must depend on eventfd
of course. I fixed the relevant commit up and pushed the new tree again.
Would appreciate a report on whether any problems are left.


> ../drivers/vhost/vhost.c: In function 'vhost_vring_ioctl':
> ../drivers/vhost/vhost.c:1577:33: error: implicit declaration of function 'eventfd_fget'; did you mean 'eventfd_signal'? [-Werror=implicit-function-declaration]
>    eventfp = f.fd == -1 ? NULL : eventfd_fget(f.fd);
>                                  ^~~~~~~~~~~~
>                                  eventfd_signal
> ../drivers/vhost/vhost.c:1577:31: warning: pointer/integer type mismatch in conditional expression
>    eventfp = f.fd == -1 ? NULL : eventfd_fget(f.fd);
>                                ^
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
