Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 792FA15BD1D
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 11:52:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C0F5855FF;
	Thu, 13 Feb 2020 10:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmutZccSM1Uy; Thu, 13 Feb 2020 10:52:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8FFC1855C7;
	Thu, 13 Feb 2020 10:52:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68598C0177;
	Thu, 13 Feb 2020 10:52:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0475C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CEF5F85FC6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jElW-DiUaVHt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:52:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 353C385F91
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581591147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Obic0sseTn6jvI331LFZBDKTd6ij6fqSxLaca0+qqQ=;
 b=IvB4Vq6IO9fXZ7MPSfZX46HBkQLU4XPmbCp5K4xipnAqBLYpNVIVy3IYCQnAVaXJfce0Lo
 2asTyRe73Hi0VshZkHi7p3iRXOILic6ZteRQ6Ot4lY82MdFCfE1X+Q0cKlCeED58B/yD0T
 YtxcxejwnA+KFAY2GDB2e1XJYRT792Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-HKb2I6-wOTKIaqyCyDEs4A-1; Thu, 13 Feb 2020 05:52:21 -0500
X-MC-Unique: HKb2I6-wOTKIaqyCyDEs4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B64081408;
 Thu, 13 Feb 2020 10:52:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D5086683C;
 Thu, 13 Feb 2020 10:52:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8B00A45B4; Thu, 13 Feb 2020 11:52:18 +0100 (CET)
Date: Thu, 13 Feb 2020 11:52:18 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] drm/qxl: replace zero-length array with flexible-array
 member
Message-ID: <20200213105218.xsjy3bv2d6c2y2mc@sirius.home.kraxel.org>
References: <20200212193344.GA27929@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212193344.GA27929@embeddedor>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
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

On Wed, Feb 12, 2020 at 01:33:44PM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertenly introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
