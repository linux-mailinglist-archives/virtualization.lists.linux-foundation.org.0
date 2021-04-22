Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9787136895D
	for <lists.virtualization@lfdr.de>; Fri, 23 Apr 2021 01:30:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3FD083E20;
	Thu, 22 Apr 2021 23:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEFMAmQ08The; Thu, 22 Apr 2021 23:30:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E132984329;
	Thu, 22 Apr 2021 23:30:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D592C000B;
	Thu, 22 Apr 2021 23:30:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97824C000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 23:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84A1D4056B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 23:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItvpOmGQ_mTs
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 23:30:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D6D940525
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 23:30:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 904CC61417;
 Thu, 22 Apr 2021 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619134236;
 bh=Oag/qHmdRa6QX9ANpkVAVsvFpxx7M8p3mEORxwqYcC4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=VV+Jhmqvm45TuZAsdwGuDIzsSSlimGhG35iIwWxas9DDJgMlNrKxQl/RxpXB04gRb
 IFK/HYgkASjCo8H09q+xrOOE3VqPTrJCx9Y9cx9jWfK07WYiVsk5/XZHzXKuTacJAE
 j8uJ30/GvloxHsMmAgcs6Z59ZgwfslXGa/aokvYbSoisJI6qbWhBYLDW97imbzJwhh
 VcqIQnJKoqYM5rQKPAIKEcHlCAwf/PTR9dYVVJ6Bu1vlA0YPetH/mRxFQGSJlwy2S7
 zq3VOqvraueSaSsw1gWNW5MbiXRFwAhyZg7VgMd0H7vyBf+A5ybSBfB3l5IQn5I8h9
 r7dr70NtMez+w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 84FB160A37;
 Thu, 22 Apr 2021 23:30:36 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: last minute fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210422182016-mutt-send-email-mst@kernel.org>
References: <20210422182016-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210422182016-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: be286f84e33da1a7f83142b64dbd86f600e73363
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18a3c5f7abfdf97f88536d35338ebbee119c355c
Message-Id: <161913423647.3750.12332768319066444186.pr-tracker-bot@kernel.org>
Date: Thu, 22 Apr 2021 23:30:36 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: lkp@intel.com, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 elic@nvidia.com, Linus Torvalds <torvalds@linux-foundation.org>,
 dan.carpenter@oracle.com
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

The pull request you sent on Thu, 22 Apr 2021 18:20:16 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18a3c5f7abfdf97f88536d35338ebbee119c355c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
