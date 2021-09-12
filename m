Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38964407B16
	for <lists.virtualization@lfdr.de>; Sun, 12 Sep 2021 02:42:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F98827D2;
	Sun, 12 Sep 2021 00:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h424971ow-Ro; Sun, 12 Sep 2021 00:42:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 41DA2827FB;
	Sun, 12 Sep 2021 00:42:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D03D4C0022;
	Sun, 12 Sep 2021 00:42:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD2C7C000D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Sep 2021 00:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C66D4415C8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Sep 2021 00:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pm2mpnvPXAEF
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Sep 2021 00:42:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F110415C7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Sep 2021 00:42:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AD88460F6F;
 Sun, 12 Sep 2021 00:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631407330;
 bh=VFXZCk3XZhvij+Ap8YQQTHyW1mEu+S5NTlxJu6sdc8Y=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KHkcCH/YDRCmsKDUTEo0I7IeyKqyTtB6/meY0aHZgjgC+2epBw1Yua0TBo6im67q1
 kmNKmtqHLF00Sy1d3d1JMBOHX6dr88Gm7pPRBAAGcZgXtcVp73wPsPyN0DOjkcEEOS
 wD4veNhvvic6+QcdIo9AxalJUaXtADEyCTdn6nuJWqPS1D9gChrOyn5spU7ok5THml
 sQWOvLrgz0OtBhkc9ypuTmbnNDtXZP836kcQ1vXWE3TJOszOB4pjxHxlyz23IVQoNW
 7FUXE7oUh420YuQ5qHRGyuEsAfAd+65FexoYCQUwRL+DWqff3aGI2GOzaUGp2Amhu3
 5nSSmuJ2lKsfQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A0EDE60A0D;
 Sun, 12 Sep 2021 00:42:10 +0000 (UTC)
Subject: Re: [GIT PULL] virtio,vdpa,vhost: features, fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210909095608-mutt-send-email-mst@kernel.org>
References: <20210909095608-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210909095608-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 7bc7f61897b66bef78bb5952e3d1e9f3aaf9ccca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 78e709522d2c012cb0daad2e668506637bffb7c2
Message-Id: <163140733059.30830.12622166761669415888.pr-tracker-bot@kernel.org>
Date: Sun, 12 Sep 2021 00:42:10 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: mgurtovoy@nvidia.com, lingshan.zhu@intel.com, kvm@vger.kernel.org,
 mst@redhat.com, xianting.tian@linux.alibaba.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, xieyongji@bytedance.com, will@kernel.org,
 viresh.kumar@linaro.org, arseny.krasnov@kaspersky.com,
 Linus Torvalds <torvalds@linux-foundation.org>, elic@nvidia.com
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

The pull request you sent on Thu, 9 Sep 2021 09:56:08 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/78e709522d2c012cb0daad2e668506637bffb7c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
