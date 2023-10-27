Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D67DA068
	for <lists.virtualization@lfdr.de>; Fri, 27 Oct 2023 20:28:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD73140A8A;
	Fri, 27 Oct 2023 18:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD73140A8A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L9S64whj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVzcxwy0cVPR; Fri, 27 Oct 2023 18:28:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5E77C40004;
	Fri, 27 Oct 2023 18:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E77C40004
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D4D7C008C;
	Fri, 27 Oct 2023 18:28:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FA37C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 18:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1171D40A8A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 18:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1171D40A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DEvo6y5KLex
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 18:28:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0970940004
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 18:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0970940004
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 04CB1B82CFA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 18:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DCDC433C7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Oct 2023 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698431306;
 bh=WIQHTuAwMRPzUGQS5kvrKRDlGiOJbdW0NtcR24FbqhM=;
 h=Date:From:To:Subject:From;
 b=L9S64whjUAfx5+qT78WWNrxRq58BUcZveL5SG0FfX7NiWcZbdDB+D6+QkhozR+NaQ
 BPQdfJVD7BDiTDaXQKd9+rriY6teBc7heSznbRJbpaH0t9MU167ePj8AIg5kLgWgQa
 Sj3M8+wPeydoRr+BR9FauxweoDvRs6ZKFo18zZB4=
Date: Fri, 27 Oct 2023 14:28:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: virtualization@lists.linux-foundation.org
Subject: Moving this list to lists.linux.dev
Message-ID: <20231027-unyielding-futuristic-lizard-d22a58@meerkat>
MIME-Version: 1.0
Content-Disposition: inline
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

Hello, everyone:

The mailman-2 system running lists.linux-foundation.org is overdue to be
retired, so we are working on finding better homes for the few remaining lists
that are still using it.

I propose migrating this list to lists.linux.dev, which is already hosting
many Linux development lists. The upcoming merge window should be a good time
to do it, as it usually results in lower mailing list traffic.

Here's how the process would go:

1. Set up virtualization@lists.linux.dev
2. Move all subscribers from the old list to the new

On the chosen flag day:

3. Remove all subscribers on the old list and add the new list address as
   the only subscriber.
4. Submit a patch to MAINTAINERS so all instances of
   virtualization@lists.linux-foundation.org are replaced with
   virtualization@lists.linux.dev

At some point a few weeks later:

5. Close the old list and add an auto-responder with instructions where all
   mail should be sent instead.

Does that work for everyone?

-K
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
