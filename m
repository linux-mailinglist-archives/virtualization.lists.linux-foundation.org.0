Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B511924D9
	for <lists.virtualization@lfdr.de>; Wed, 25 Mar 2020 10:59:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 13676887B5;
	Wed, 25 Mar 2020 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8peT6j0dsR-8; Wed, 25 Mar 2020 09:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91174887B9;
	Wed, 25 Mar 2020 09:59:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78BB2C0177;
	Wed, 25 Mar 2020 09:59:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCB12C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 09:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5BA3887B5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 09:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJWWTy6Bxu6r
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 09:59:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4555C887B1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585130382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E28MMaAg2Rq74B9GHLdMLCeDNE/kzIHBch46RLtapL0=;
 b=FLgKEjvFgqVQsPw7S28dSPBqKPWNmG3+XJHgv1ieRtLidXi524/POAwyu00avHgv1XQpCd
 FIsCGwFReTShdaF2yrdY1H0q+V5uMk680iG9fAPTCkPuKBvPbnS018rXVL1x2aW8NWO1iB
 1FnYnk2Oe9qRSLT7c1ygzDispivaKCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-UkxxZoVqOlmQW2B8TIESxA-1; Wed, 25 Mar 2020 05:59:41 -0400
X-MC-Unique: UkxxZoVqOlmQW2B8TIESxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C4C0189D6C3;
 Wed, 25 Mar 2020 09:59:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0BF25C28E;
 Wed, 25 Mar 2020 09:59:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1339A17535; Wed, 25 Mar 2020 10:59:38 +0100 (CET)
Date: Wed, 25 Mar 2020 10:59:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Juerg Haefliger <juergh@gmail.com>
Subject: Re: arm64 kernel crash in bochs_get_edid_block() with QEMU '-device
 VGA'
Message-ID: <20200325095938.vn4v7bdk6pgmotxg@sirius.home.kraxel.org>
References: <CADLDEKugE-Y9rMumiCDJDW_FvGcBaQd3fBv80YeSS0=udnkMAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADLDEKugE-Y9rMumiCDJDW_FvGcBaQd3fBv80YeSS0=udnkMAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org
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

On Sat, Feb 15, 2020 at 01:11:45PM +0100, Juerg Haefliger wrote:
> The QEMU default edid=off results in a kernel crash [1] on arm64 due
> to commit [2]. To reproduce:

Should be fixed in qemu 5.0-rc0

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
