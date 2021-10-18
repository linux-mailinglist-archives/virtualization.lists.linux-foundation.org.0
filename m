Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8343101F
	for <lists.virtualization@lfdr.de>; Mon, 18 Oct 2021 08:02:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898F360595;
	Mon, 18 Oct 2021 06:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6M2i7RmEhHdd; Mon, 18 Oct 2021 06:02:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8048B6071B;
	Mon, 18 Oct 2021 06:02:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F1FCC0022;
	Mon, 18 Oct 2021 06:02:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B69EDC000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 06:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F5E782DE6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 06:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYpshAJPbEqi
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 06:02:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8139C82AC8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 06:02:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 11FAB60F25;
 Mon, 18 Oct 2021 06:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634536947;
 bh=jHc1ArAsX9ODB5TiB6eugodCntdFiZx9IqtuY32ULKo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GDcEJoEBz9v3chMkrtpy7KO6QCYQu/NNF2Lu0s0OG4o+1po6ituIq8i2SWfiEVsBG
 m0BVQurg8oivKsp8wfC3L3q/K2u+xdRlUxD9M7ek2bgimekWa4DgDuIIQMY+WV24Sb
 PiRvF9Je/EMBjrONLgqiLQSr2pPxYlkQsBf3vXE1fn6jmBIkdzCvYhP8usaU19apD2
 z1RtkFEZh+jtrJLxqr/MGn8FKj3FUZ2JiGWnEkUfetneeS6QpneSYi2Vi2jd/G8Fr/
 a1JPK9V1PUxtj4mGeRLepWqBPzT0dEBEP6VqsoIXWXcKON5HJp3QZ2rteezL/1peHO
 RaPQcG3CJdSBw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EBBFC600E6;
 Mon, 18 Oct 2021 06:02:26 +0000 (UTC)
Subject: Re: [GIT PULL] virtio,vdpa: fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211017104900-mutt-send-email-mst@kernel.org>
References: <20211017104900-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211017104900-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: bcef9356fc2e1302daf373c83c826aa27954d128
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bb50f8530c9cb5ec69c0744b7fd32d0ca404254
Message-Id: <163453694690.9773.12279094571248426582.pr-tracker-bot@kernel.org>
Date: Mon, 18 Oct 2021 06:02:26 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: rdunlap@infradead.org, lulu@redhat.com, kvm@vger.kernel.org, corbet@lwn.net,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 xieyongji@bytedance.com, mst@redhat.com, wuzongyong@linux.alibaba.com,
 Linus Torvalds <torvalds@linux-foundation.org>, markver@us.ibm.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The pull request you sent on Sun, 17 Oct 2021 10:49:00 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bb50f8530c9cb5ec69c0744b7fd32d0ca404254

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
