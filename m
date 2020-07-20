Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 51787227222
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 00:22:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE99B88363;
	Mon, 20 Jul 2020 22:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCPMRle0jbNN; Mon, 20 Jul 2020 22:22:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 46F2A8835C;
	Mon, 20 Jul 2020 22:22:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 162ADC016F;
	Mon, 20 Jul 2020 22:22:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38A7FC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 22:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2ED568835E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 22:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WElp4KFh2Jy2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 22:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B46C88098
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 22:22:15 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id y2so19324579ioy.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1TOa/60ANKufyEkSnLRxvVlSHtDFv9RQ3Ysqa0fln/Y=;
 b=MIqiHcCylUWLD46p4ZoKgIIYxy9Aq/eSMrkIUuY1r8jFFyeO7H2x6EPDKKz2glwLqH
 pRUXJto3bE2z6ZW3cNK+BEPJfx4L2JOpKBbWrQHzKO+KagYlt+FKBWNIMEurz4GXQLjK
 zUnB53r5l5POxhdlXBnouyvCs5tD2krgLYckuyCTiUtg2Z0ynjcERMkwfcAk59eD/p02
 5B9xS9o7BVjfZxo4Jzo4sK1BQQfxnZ5kRP6EusYm1p/oKDWThpqYVXrk9XwrlcYTeacs
 QWFLJoHpeC7Nnlrcus/vwbbMKBuMgp532xVs199iykK2CnbQqWHt5yOWG4sWL787SAkS
 zIvw==
X-Gm-Message-State: AOAM531Mj9RNA7S7EbW3DjgtJzdmx7ZdWjkcDtKO4eQz7vxjDX0ZI6y+
 f2csgA/CufEbRoJucdZjFA==
X-Google-Smtp-Source: ABdhPJyJeCLpbJ6mwgxBthab2PyLawiy90UiXQqSNbmnm+A/l98UNK3qqZcteAfpD7RSr0XceYKj0A==
X-Received: by 2002:a6b:8e56:: with SMTP id q83mr25162174iod.61.1595283734976; 
 Mon, 20 Jul 2020 15:22:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u15sm9602118iog.18.2020.07.20.15.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 15:22:14 -0700 (PDT)
Received: (nullmailer pid 3056611 invoked by uid 1000);
 Mon, 20 Jul 2020 22:22:13 -0000
Date: Mon, 20 Jul 2020 16:22:13 -0600
From: Rob Herring <robh@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH] VIRTIO CORE AND NET DRIVERS: Replace HTTP links with
 HTTPS ones
Message-ID: <20200720222213.GA3056536@bogus>
References: <20200709064755.24051-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709064755.24051-1-grandmaster@al2klimov.de>
Cc: devicetree@vger.kernel.org, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, robh+dt@kernel.org
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

On Thu, 09 Jul 2020 08:47:55 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
> 
>  Documentation/devicetree/bindings/virtio/mmio.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
