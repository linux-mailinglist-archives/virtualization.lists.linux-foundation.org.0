Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C619EB2D4D
	for <lists.virtualization@lfdr.de>; Sun, 15 Sep 2019 01:25:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3C2BF9EE;
	Sat, 14 Sep 2019 23:25:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D956F89C
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 23:25:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A74342C6
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 23:25:06 +0000 (UTC)
Subject: Re: [PULL] vhost: a last minute revert
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568503506;
	bh=iBQBEA3uIqdk00gdwd+B3Cq4P9l9gIj9SR2TQ2C82lM=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=Na8bS16rUEizU0A5NcPGOinkD87+iv2mvooco1NWMrM3IdU8ioPH++LHyaV1Uvvgu
	I/i8igs7Lk9s46AFsEen3hWOBAbeO72FeiksCZgM7DHdq72sBvrBkcxaOjUingyAJb
	2f60vFbCMTz4GiSq4qOeJkahy8w2PdGk3nOIzZ60=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190914153859-mutt-send-email-mst@kernel.org>
References: <20190914153859-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190914153859-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
	tags/for_linus
X-PR-Tracked-Commit-Id: 0d4a3f2abbef73b9e5bb5f12213c275565473588
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f9c632cde0c3d781463a88ce430a8dd4a7c1a0e
Message-Id: <156850350648.2116.2811850659740913129.pr-tracker-bot@kernel.org>
Date: Sat, 14 Sep 2019 23:25:06 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Linus Torvalds <torvalds@linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The pull request you sent on Sat, 14 Sep 2019 15:38:59 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f9c632cde0c3d781463a88ce430a8dd4a7c1a0e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
