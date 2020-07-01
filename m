Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F7210591
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 09:58:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B79D8C2D1;
	Wed,  1 Jul 2020 07:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMrwZBbJkC61; Wed,  1 Jul 2020 07:58:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 327A18C2E2;
	Wed,  1 Jul 2020 07:58:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26795C0733;
	Wed,  1 Jul 2020 07:58:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA069C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 07:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C62E788CD6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 07:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cv07_uzrGXfp
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 07:57:57 +0000 (UTC)
X-Greylist: delayed 00:17:26 by SQLgrey-1.7.6
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0712C88D29
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 07:57:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id E3CDA3A522C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 07:39:07 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net
 [50.39.163.217]) (Authenticated sender: josh@joshtriplett.org)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 62C6060003;
 Wed,  1 Jul 2020 07:38:49 +0000 (UTC)
Date: Wed, 1 Jul 2020 00:38:46 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/18] Allow architectures to override __READ_ONCE()
Message-ID: <20200701073846.GC301687@localhost>
References: <20200630173734.14057-1-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630173734.14057-1-will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 linux-alpha@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Matt Turner <mattst88@gmail.com>, kernel-team@android.com,
 Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <rth@twiddle.net>
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

On Tue, Jun 30, 2020 at 06:37:16PM +0100, Will Deacon wrote:
> The patches allow architectures to provide their own implementation of
> __READ_ONCE(). This serves two main purposes:
> 
>   1. It finally allows us to remove [smp_]read_barrier_depends() from the
>      Linux memory model and make it an implementation detail of the Alpha
>      back-end.

And there was much rejoicing. Thank you.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
