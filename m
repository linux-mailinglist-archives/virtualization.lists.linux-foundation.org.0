Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CF41B225
	for <lists.virtualization@lfdr.de>; Tue, 28 Sep 2021 16:31:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D83140557;
	Tue, 28 Sep 2021 14:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDr0I1nmqrTr; Tue, 28 Sep 2021 14:31:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 68772401CA;
	Tue, 28 Sep 2021 14:31:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF125C000D;
	Tue, 28 Sep 2021 14:31:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A732C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 14:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 172EE8197D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 14:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kuna-TBV91FO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 14:31:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8879081971
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 14:31:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 26C8B61209;
 Tue, 28 Sep 2021 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632839474;
 bh=EgMsATwK+z9MklT81mtu/IjIQhMpyFPQe+UMism4VLk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=f/5Y24zMJ1LapGxcHoUpqdLXv5tvZZBgxqVmW2isV5lvPQNOCgii/3gP2VpUQyoiJ
 H7dGW1p9tAuyHEWMy0RuVhmVJcEyFYuq3Np4epmqM90+PP75wFbT1lB+Ltgf9ppRoY
 Bgkdy/MGv7vYhMjFC0NTMorDr9BTmVOGpEsiHGvlWx2LUVmQeHOUHUDLlkfxp0/8Zr
 ITJd8DkAHw9ucfX10YO4ELDdmQIvLbeOU7Miaw1S933DSIMuHczNjBcBopuHJTTE8C
 3n2PNQyHlLrk0v4yqcth6IWq4Bk0lasm5ClfLATQ1aJoZiBGXgkpWxmHFk8FPVWMJS
 zy0iLbY/FJ1Rg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1F66960A59;
 Tue, 28 Sep 2021 14:31:14 +0000 (UTC)
Subject: Re: [GIT PULL] virtio,vdpa: fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210927183003-mutt-send-email-mst@kernel.org>
References: <20210927183003-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: Linux virtualization
 <virtualization.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20210927183003-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: be9c6bad9b46451ba5bb8d366c51e2475f374981
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d33bec7b3dfa36691ed53ccaaf187d90b53be852
Message-Id: <163283947412.32258.5234903356989794369.pr-tracker-bot@kernel.org>
Date: Tue, 28 Sep 2021 14:31:14 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, arnd@arndb.de, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xieyongji@bytedance.com, dan.carpenter@oracle.com, viresh.kumar@linaro.org,
 elic@nvidia.com, Linus Torvalds <torvalds@linux-foundation.org>,
 linux@roeck-us.net
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

The pull request you sent on Mon, 27 Sep 2021 18:30:03 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d33bec7b3dfa36691ed53ccaaf187d90b53be852

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
