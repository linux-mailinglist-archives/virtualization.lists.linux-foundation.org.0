Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA3A214F99
	for <lists.virtualization@lfdr.de>; Sun,  5 Jul 2020 22:50:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1DF66203FE;
	Sun,  5 Jul 2020 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSUqnvo67kPI; Sun,  5 Jul 2020 20:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B1460203D9;
	Sun,  5 Jul 2020 20:50:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E14EC0893;
	Sun,  5 Jul 2020 20:50:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8EFFC016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A6B5A89276
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 20:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uo+QoojEKLQY
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 20:50:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0195.hostedemail.com
 [216.40.44.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADA5C89279
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 20:50:39 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 8F8B48005026
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 20:50:37 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 19E2A182CED28;
 Sun,  5 Jul 2020 20:50:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1542:1593:1594:1711:1712:1730:1747:1777:1792:2393:2525:2553:2561:2564:2682:2685:2828:2829:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3653:3865:3866:3867:3868:3870:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4605:5007:6119:7514:7875:7903:7914:9025:9545:10004:10400:10848:11026:11232:11658:11914:12043:12295:12296:12297:12438:12555:12679:12740:12760:12895:13095:13149:13230:13439:14181:14659:14721:21080:21324:21433:21451:21627:21819:21939:30003:30029:30054:30083:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: pull35_340319026ea6
X-Filterd-Recvd-Size: 3449
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Sun,  5 Jul 2020 20:50:33 +0000 (UTC)
Message-ID: <0334ec747d2e44a2ec3fd6147cfe139200d8b853.camel@perches.com>
Subject: Re: [PATCH 5/5] virtio_console: Constify some static variables
From: Joe Perches <joe@perches.com>
To: Amit Shah <amitshah@gmx.net>, Rikard Falkeborn <rikard.falkeborn@gmail.com>
Date: Sun, 05 Jul 2020 13:50:32 -0700
In-Reply-To: <20200703175529.GE3150@trundl.on>
References: <20200701200950.30314-1-rikard.falkeborn@gmail.com>
 <20200701200950.30314-6-rikard.falkeborn@gmail.com>
 <20200703175529.GE3150@trundl.on>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org
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

On Sun, 2020-07-05 at 20:30 +0200, Amit Shah wrote:
> On (Wed) 01 Jul 2020 [22:09:50], Rikard Falkeborn wrote:
> > The id_table and feature_table pointers in struct virtio_driver are
> > pointers to const. Mark the corresponding static variables const to
> > allow the compiler to put them in read-only memory.
> > 
> > Before:
> >    text    data     bss     dec     hex filename
> >   25447     713      76   26236    667c drivers/char/virtio_console.o
> > 
> > After:
> >    text    data     bss     dec     hex filename
> >   25488     673      76   26237    667d drivers/char/virtio_console.o
> > 
> > Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> 
> Reviewed-by: Amit Shah <amit@kernel.org>
> 
> Please CC me on the entire series instead of individual patches in the
> future.

CC'ing individual maintainers on entire patch sets
that span multiple subsystems doesn't scale.

Given that lore.kernel.org now stores all emails
sent to lkml, it's a reasonable thing to add a
reference to the cover letter below the --- line
to make it easier for individual recipients of
patches in a series to find the entire patch set.

i.e. Send emails with something like:

Subject: [PATCH N/M] foo: bar

commit message

Signed-off-by: J. Random Developer <address@domain.tld>
---

Link: https://lore.kernel.org/r/<message_id_of_cover_letter>

[patch]

A trivial script to insert these links if all patches
in a series are stored in a separate directory:

$ bash insert_cover_letter_link.bash <patch_directory>

---
$ cat insert_cover_letter_link.bash
#!/bin/bash

find $@ -name "*.patch" | sort | \
    while read file ; do

	echo "File: <$file>"
	if [[ $(basename $file) =~ ^0000- ]] ; then
	    message_id=$(grep '^Message-Id: <' $file)
	    if [ $? -ne 0 ] ; then
		echo "Message_Id not found"
		exit 1
	    fi
	    message_id=$(echo $message_id | \
			     sed -r -e 's/^Message-Id:\s*<//' -e 's/>\s*$//')
	    separator="-- "
	    echo "Message_Id: <$message_id>"
	else
	    separator="---"
	fi
	
	if [[ "$message_id" == "" ]] ; then
	    echo "Patch series cover letter Message_Id not found"
	    exit 1
	fi

	perl -n -i -e "if (\$_ =~ /^$separator$/) { print; print \"\\n\"; print \"Link: https://lore.kernel.org/r/\" . '$message_id' . \"\\n\"; print \"\\n\"; } else { print; }" $file

    done

exit 0


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
