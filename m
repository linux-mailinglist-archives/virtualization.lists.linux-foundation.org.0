Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9E6645B5
	for <lists.virtualization@lfdr.de>; Tue, 10 Jan 2023 17:12:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF78417E7;
	Tue, 10 Jan 2023 16:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF78417E7
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ocxaezud
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXP2c9GFutrd; Tue, 10 Jan 2023 16:12:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E47AC417E4;
	Tue, 10 Jan 2023 16:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E47AC417E4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15E58C0078;
	Tue, 10 Jan 2023 16:12:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFFE6C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAD3961025
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD3961025
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Ocxaezud
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jM8CqR-naqUU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:12:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B072F60AA5
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B072F60AA5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 16:12:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D240BB81158;
 Tue, 10 Jan 2023 16:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8E9C4339E;
 Tue, 10 Jan 2023 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673367163;
 bh=dOrFDIBJcGY9/6FT5q05/EQuzcQjBBepmA+CyX1veYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=OcxaezudOhjo1O8CtMFIlnZtZCDOO5AnNtZJ4TDiYmEcUMtGmNW/6l0K9xs7X2vEh
 yugvStbSTQApELhOwWyszuEqrXHpGWaMKBJHFEOATzMwkAf9Kxp0zqcHdsohvGutSX
 u0SLn4IqJhEd8wiPwuPSMdbamnUvISW3USlRhMI0dwatn759L6oMf05M3wbFbK2eW5
 gLXtmbDiDnYGxolB1JfYjtaFBLWuj9zks4/oPOxmTwmf6AE6k/wNR3t+71fbi7GtoK
 c4i8mRZ6LP+g/xTofcAgNeJtqd3T9Mj6jIj6zcPCwxcJXw3etOpUp7Mwih9vgIrNKl
 X3lV6wFQLNS8Q==
Date: Tue, 10 Jan 2023 10:12:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Subject: Re: [PATCH v8 1/3] PCI: Add SolidRun vendor ID
Message-ID: <20230110161241.GA1507687@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs=3_Cx1Pxg4iwLY5eWV9RVJoJ-btZVop3rHhzFmtErMJzj1Q@mail.gmail.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mst@redhat.com
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

On Tue, Jan 10, 2023 at 05:46:37PM +0200, Alvaro Karsz wrote:
> > This should be indented with tabs instead of spaces so it matches the
> > rest of the file.
> 
> Michael, sorry about all the versions..
> Do you want me to fix it in a new version?
> I could fix it with a patch directly to the pci maintainers after your
> linux-next is merged, if this is ok with everyone.

It's not worth merging this patch and then adding another patch on top
just to convert spaces to tabs.

> > It's helpful if you can send the patches in a series so the individual
> > patches are replies to the cover letter.  That makes tools and
> > archives work better:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/5.Posting.rst?id=v6.1#n342
> 
> Yes, I fixed it in the next version:
> https://lists.linuxfoundation.org/pipermail/virtualization/2023-January/064190.html

It doesn't look fixed to me.  The "lore" archive is better than
pipermail, and the cover letter doesn't show any replies:
https://lore.kernel.org/linux-pci/20230109080429.1155046-1-alvaro.karsz@solid-run.com/

If you look at https://lore.kernel.org/linux-pci/, you'll see the
typical thread structure with patches nested under the cover letter.
The patches have "In-Reply-To" headers that reference the cover
letter.

Bjorn
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
