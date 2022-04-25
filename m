Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9250DE02
	for <lists.virtualization@lfdr.de>; Mon, 25 Apr 2022 12:36:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DACE540908;
	Mon, 25 Apr 2022 10:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lY9Hw5V72qry; Mon, 25 Apr 2022 10:36:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 271DC40913;
	Mon, 25 Apr 2022 10:36:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31D46C0085;
	Mon, 25 Apr 2022 10:36:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F47CC007F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 10:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4164960AE2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 10:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Emwc6U9B3eey
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 10:36:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5231460B6C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Apr 2022 10:36:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1225A60EC5;
 Mon, 25 Apr 2022 10:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC36C385A7;
 Mon, 25 Apr 2022 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650882968;
 bh=wkyNxnKYvpuBo7kmCBxnLUwwRMn5XI30arFCVougD+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fJJ/Pe5gF0UyKVzOXciVE3aqwc6iWwdwdYr988a7lID1iQ8yjBxPZE6CYNvnKBVwI
 DyfBf6AzVmnP2OUwy1fiUJ59QMW6ySgHu6T5onoZe/2j7hzuMygTzuHrTooWQqCqZY
 U2zcNMEmgto2jAUNTCmWHt9P4niJptV5mitbJLd8=
Date: Mon, 25 Apr 2022 12:36:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: [PATCH 5.10.y] drm/cirrus: fix a NULL vs IS_ERR() checks
Message-ID: <YmZ5lZMkjo3XlYdN@kroah.com>
References: <20211228132556.108711-1-shile.zhang@linux.alibaba.com>
 <YcsWcqVN7Dwue1I2@kroah.com>
 <f4dedbfc-0cca-a6cb-996b-4bd928008269@linux.alibaba.com>
 <YcsZqU8M11elHqg3@kroah.com>
 <1cc25ebe-2c68-458b-15a2-fc4c80ba2054@linux.alibaba.com>
 <Ycshhu6pXC4Pt1YK@kroah.com>
 <c74d61a5-31dc-0946-5a35-e1a4cd549b6e@linux.alibaba.com>
 <YcxjGDxgF+mA7vLY@kroah.com>
 <ae3ebd93-e3c0-ec2e-24be-07241b558b5e@linux.alibaba.com>
 <550e9439-adf6-3df8-41a0-9a7ee5447907@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550e9439-adf6-3df8-41a0-9a7ee5447907@linux.alibaba.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Wen Kang <kw01107137@alibaba-inc.com>, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>
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

On Sun, Apr 24, 2022 at 11:27:17AM +0800, Shile Zhang wrote:
> Hi David and Daniel,
> 
> Sorry but could you please help to check this issue?
> Due to the function 'drm_gem_shmem_vmap' could return ERROR pointers which
> will cause the kernel crash due to 'cirrus_fb_blit_rect' only check the
> pointer.
> 
> Since the related code has been refactoring in mainline, so this issue only
> happened in stable 5.10.y branch.
> 
> @Greg
> I think it is probably not realistic to backport the related refactoring
> from mainline directly, so I just give this bugfix patch only for 5.10.y
> branch.

I'm sorry, but I do not have "this bugfix" in my queue anymore,
considering it is so old.  Please rebase and resubmit.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
