Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3728AD839C
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 00:25:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7C8BEEE3;
	Tue, 15 Oct 2019 22:25:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 34372EC2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 22:25:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0A244821
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 22:25:08 +0000 (UTC)
Subject: Re: [PULL] vhost: cleanups and fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571178307;
	bh=kvmC4E7L+oeDDz2E8MyZ7vy8vlZuBNRvi0r5zkZQzEw=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=bnEMMCiIkY+cceDhVmWI3SwGLOVkTzLzCA/iEbt/KJrqDlApuq1MhEKMRMmJl0rAl
	osldAywju56GIGmKTtqF+C+aeNULWZ94iC2j7vYgpDe4VJhvo7DujiguCdSUN2Kl1R
	7OYLubeq6rVlb+Xn702ULY86zKyVld5Q9SzjvvvU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191015171908-mutt-send-email-mst@kernel.org>
References: <20191015171908-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191015171908-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
	tags/for_linus
X-PR-Tracked-Commit-Id: 245cdd9fbd396483d501db83047116e2530f245f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b1f00aceb7a67bf079a5a64aa5c6baf78a8f442
Message-Id: <157117830785.470.239830549616573165.pr-tracker-bot@kernel.org>
Date: Tue, 15 Oct 2019 22:25:07 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, jan.kiszka@web.de,
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

The pull request you sent on Tue, 15 Oct 2019 17:19:08 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b1f00aceb7a67bf079a5a64aa5c6baf78a8f442

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
