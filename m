Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4178C297749
	for <lists.virtualization@lfdr.de>; Fri, 23 Oct 2020 20:53:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4CCC87097;
	Fri, 23 Oct 2020 18:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRfuTgcWRYPi; Fri, 23 Oct 2020 18:53:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C09EB8703F;
	Fri, 23 Oct 2020 18:53:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4357C0051;
	Fri, 23 Oct 2020 18:53:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14542C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 18:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 080478703F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 18:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TzU3n0QEHKJm
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 18:53:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9E13A86FD9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 18:53:10 +0000 (UTC)
Subject: Re: [GIT PULL] vhost,vdpa,virtio: cleanups, fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603479190;
 bh=Fut4z9JGmD3maTcbN0fyqQYAM6FFJ60UFXb6vsO1lrQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=1rYV7y8L4fqyq9/Y6Bnv1MRUN5CH9C1NVdDlnXKwc+pHbTGwO+qs9nuzXdqbcqgQ2
 iK879U4YmweY6ZAB3WKs5YSBOBm357iHtVfUFwj6qAaBElopHUrBpO3aA07Cyr9mpu
 +ORWDuaAJduX+3FjpxGUBUrHT/szHvvNtSoosSfs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201023113832-mutt-send-email-mst@kernel.org>
References: <20201023113832-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: Linux virtualization
 <virtualization.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20201023113832-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 88a0d60c6445f315fbcfff3db792021bb3a67b28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9313f8026328d0309d093f6774be4b8f5340c0e5
Message-Id: <160347919010.2166.1997610625454370758.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2020 18:53:10 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: pankaj.gupta.linux@gmail.com, pmorel@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 rikard.falkeborn@gmail.com, virtualization@lists.linux-foundation.org,
 li.wang@windriver.com, borntraeger@de.ibm.com, stable@vger.kernel.org,
 tiantao6@hisilicon.com, elic@nvidia.com,
 Linus Torvalds <torvalds@linux-foundation.org>, lingshan.zhu@intel.com
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

The pull request you sent on Fri, 23 Oct 2020 11:38:32 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9313f8026328d0309d093f6774be4b8f5340c0e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
