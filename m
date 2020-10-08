Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E330287E12
	for <lists.virtualization@lfdr.de>; Thu,  8 Oct 2020 23:37:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 365A08752B;
	Thu,  8 Oct 2020 21:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzqaNjgdFqLZ; Thu,  8 Oct 2020 21:37:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8DFE865D5;
	Thu,  8 Oct 2020 21:37:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA710C0051;
	Thu,  8 Oct 2020 21:37:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC287C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 21:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABB6886A24
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 21:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPoLu1V4PJmT
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 21:37:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7C62686987
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 21:37:45 +0000 (UTC)
Subject: Re: [GIT PULL] vhost,vdpa: last minute fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602193065;
 bh=XS1HskSXLJf+LYLFsE6ajUTo2eQzDoEdbBf1YNqM7u0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=dKd3zSsHJYrGMRpDprCyOmqOGWFqmVGEky+iBm1QOIEw0lEtQGcSURQxkhbaX7gCd
 SWcv1qdUriNz1P7DtyBBBJ8mz5FeDVQOVb2Y/eaJRjhjLMzEpNoz+P4slsU3FbaPwu
 dPxQ/Ey04e7ACH0NKFFWLNCC8f9R6C64aXaaradg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201008163051-mutt-send-email-mst@kernel.org>
References: <20201008163051-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: Linux virtualization
 <virtualization.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20201008163051-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: aff90770e54cdb40228f2ab339339e95d0aa0c9a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3fdd47c3b40ac48e6e6e5904cf24d12e6e073a96
Message-Id: <160219306497.23094.13564756320158233179.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2020 21:37:44 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: lkp@intel.com, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, si-wei.liu@oracle.com,
 elic@nvidia.com, Linus Torvalds <torvalds@linux-foundation.org>,
 michael.christie@oracle.com
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

The pull request you sent on Thu, 8 Oct 2020 16:30:51 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3fdd47c3b40ac48e6e6e5904cf24d12e6e073a96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
