Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B2A1BDB37
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 13:58:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62EA3869C5;
	Wed, 29 Apr 2020 11:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKJBYT2-v8Nw; Wed, 29 Apr 2020 11:58:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00310869D7;
	Wed, 29 Apr 2020 11:58:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D99BAC0172;
	Wed, 29 Apr 2020 11:58:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 441F1C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3FDE888377
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbBObBsqIjye
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE8588813E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588161523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HWuedvL2Xnv6jeh+s8KXtU9bUO1lVbq393a+/Lm6OKQ=;
 b=GbiAkzOkzUUmPFPGweblAnNk6L4XFoGUw9oeKqOzKEIPc3nDgUulHCQ1eH0W0UVDwlNlmk
 vcbhauAwcWLahV3sBuTZGf99ZisnepmffXoJ2Si1r/cV8zB4NvdjVv75ibXp++i5WKp9Mg
 BFj0YTXmvxliNcrJs0p+uEtG2rAlew4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-3N4AxkhzNWqZVj96TKq8Yg-1; Wed, 29 Apr 2020 07:58:41 -0400
X-MC-Unique: 3N4AxkhzNWqZVj96TKq8Yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42D99804A40;
 Wed, 29 Apr 2020 11:58:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B052282E2;
 Wed, 29 Apr 2020 11:58:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 49D651753B; Wed, 29 Apr 2020 13:58:36 +0200 (CEST)
Date: Wed, 29 Apr 2020 13:58:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/1] Add uvirtio for testing
Message-ID: <20200429115836.u5vqt3s6l4wcejjd@sirius.home.kraxel.org>
References: <20200428204729.64569-1-ytht.net@gmail.com>
 <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mst@redhat.com, Lepton Wu <ytht.net@gmail.com>,
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

> 3) Need to be verbose on how the vring processing work in the commit log of
> patch 1

Ecven better a file documenting the interface somewhere in
Documentation/

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
