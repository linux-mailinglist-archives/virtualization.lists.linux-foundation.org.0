Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D17DE5ED
	for <lists.virtualization@lfdr.de>; Wed,  1 Nov 2023 19:17:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96281485E1;
	Wed,  1 Nov 2023 18:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96281485E1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JZT1Ez/2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFC20cD18Hgy; Wed,  1 Nov 2023 18:17:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 28F2046A5D;
	Wed,  1 Nov 2023 18:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F2046A5D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4574AC008D;
	Wed,  1 Nov 2023 18:17:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86411C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Nov 2023 18:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DF43400C5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Nov 2023 18:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DF43400C5
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=JZT1Ez/2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iuw_ZIjSmvop
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Nov 2023 18:17:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50E4C431DC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Nov 2023 18:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E4C431DC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E0BE60BD8;
 Wed,  1 Nov 2023 18:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2798FC433C8;
 Wed,  1 Nov 2023 18:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698862623;
 bh=SrH+DyauWQdsd/tmDyVondyGkBUZFmKGvIBbciTief8=;
 h=Date:From:To:Subject:From;
 b=JZT1Ez/2VSqel7g1YVuJkg/vRmvSggsGYaxXkHfJPaIXaGmvYJLb46KYuSoofTGYC
 TZQw8LvTK7pBl/fJo3mC0oWz2Mr+OB3ACPxx13B//mxDmPtqqj1b13SJF58Bq6yZVH
 c3ep0s0FkQzLuR8F37rbUyvDGLypP6Yv/4WTl8NA=
Date: Wed, 1 Nov 2023 14:17:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: virtualization@lists.linux-foundation.org
Subject: PSA: this list is moving to virtualization@lists.linux.dev
Message-ID: <20231101-camouflaged-screeching-platypus-9577cb@nitro>
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

Hello, all:

As stated before [1], this list cannot stay on its current mailman-2 system, so I
am proceeding with moving this list to lists.linux.dev. The current plan is to
move it next week on November 7 around 10:30 AM PST (18:30 UTC).

Here's the impact of this change:

1. *The old address will continue to work*, so any existing conversations can
   continue and any new patches sent to the old list address will be properly
   delivered to list subscribers. The new canonical list address will be
   virtualization@lists.linux.dev.

2. All subscribers will be automatically moved to the new system, so no action
   is required on anyone's part to keep their subscription.

3. The archive on https://lore.kernel.org/virtualization/ will be
   automatically updated to track the new list address.

4. The List-ID header will change, regardless to which address the message is
   sent:

   before: List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
    after: List-Id: <virtualization.lists.linux.dev>

5. The mailman footer will no longer be added to message bodies.

6. Subscribing and unsubscribing will be done using the mlmmj supported
   commands, described at https://subspace.kernel.org/subscribing.html

I believe this switch will not cause any significant disruption. Once the
switch is completed, I will submit a patch to MAINTAINERS to update all
entries with the old address.

Please let me know if you have any questions or concerns.

Best regards,
-K

[1] https://lore.kernel.org/virtualization/20231027-unyielding-futuristic-lizard-d22a58@meerkat/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
