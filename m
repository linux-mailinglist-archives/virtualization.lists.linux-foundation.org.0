Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B462EB50D
	for <lists.virtualization@lfdr.de>; Tue,  5 Jan 2021 22:53:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 975A685124;
	Tue,  5 Jan 2021 21:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VogbeGuWXrU; Tue,  5 Jan 2021 21:53:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3181F8511F;
	Tue,  5 Jan 2021 21:53:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 125A0C013A;
	Tue,  5 Jan 2021 21:53:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C53A7C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 21:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B161620458
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 21:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Fn-HskWNSF7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 21:53:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 817CA20370
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 21:53:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BB9F22D71;
 Tue,  5 Jan 2021 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609883626;
 bh=kNBRJ/aYElKhpZB7C2UbcKqb2wXkZAMaMM77Gk3XDSQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HmNwYF6TQtua/muVF6OsQfV0fKaR4+E2K6/aHXQ26zu+OwlSOcTw88T9RIHV6bTun
 CtESrkScGVvZEEBtRetIM33xaztogp0I5dD7GWBgCUMNQrRpByqei06SF3YBaERCjT
 AjbCCabU+qnwgYhAjDKwoLRup6HsA7Jmkpn5dJEW7UCv15xVieJlPvHsLqRA7aSE9G
 YrqUY/HsGL3JnWhV+3unPlBreYkr1Fv6XmXN2tb7EB1v5+fsU7QmNgDzDEBnMu4b1u
 MEcvmW5hDlCJSGjnoABthpqMwBfPmuMggzsrYGh7HL5KYnh+WLFVOzEVO2+LEJZxVU
 5Hf0AB1skjFcQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E51F06012A;
 Tue,  5 Jan 2021 21:53:45 +0000 (UTC)
Subject: Re: [GIT PULL] vhost: bugfix
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210105072145-mutt-send-email-mst@kernel.org>
References: <20210105072145-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <kvm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210105072145-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: e13a6915a03ffc3ce332d28c141a335e25187fa3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f1abbe97c08ba7ed609791627533a805a1b2c66
Message-Id: <160988362586.4244.11494741917772052343.pr-tracker-bot@kernel.org>
Date: Tue, 05 Jan 2021 21:53:45 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
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

The pull request you sent on Tue, 5 Jan 2021 07:21:45 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f1abbe97c08ba7ed609791627533a805a1b2c66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
