Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A38587F8A
	for <lists.virtualization@lfdr.de>; Tue,  2 Aug 2022 17:57:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 687A560C2A;
	Tue,  2 Aug 2022 15:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 687A560C2A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=durJ8rzT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVRhOzH55Q6d; Tue,  2 Aug 2022 15:56:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3F76160ACC;
	Tue,  2 Aug 2022 15:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F76160ACC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F510C0078;
	Tue,  2 Aug 2022 15:56:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F013AC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Aug 2022 15:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE138408B6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Aug 2022 15:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE138408B6
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=durJ8rzT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moEBD8zK63fC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Aug 2022 15:56:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B11D401A4
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B11D401A4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Aug 2022 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2YTEddQgV3eve/kjK7FvWj0CYDE8kF529gnIudt05K8=; b=durJ8rzTa5TjusG/D0VqOozZ73
 0TBxrRR8NanWNRXemQHlc2AgiYZb0Q+sdFUDzIdsoULMtTQvZewla/ipoGW8tCDVptb9rPxndT9hJ
 /WkOQiwQ9qH/ucJzkCSVBcBx1J4KZkw4sUmAVHsstE/ihi5+HmnbepmyM1ASsmGytCYotSz7T/CR4
 zwEKEB9pGa82SctZmbEQwO+kCWpRCszUZdPjZ4AyOqobn6Cep4YlFzq4spg+bVzquTU0aLGRTGHh/
 vQfmZFDs9DS4zxnj9bCTaPJsh7iVnhi12RifV0ZhtEIzqTXvXHCnmNFM5gr1zJaepfhsVT8su8ClV
 d00mF7kg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oIuGG-008Tko-1l; Tue, 02 Aug 2022 15:56:48 +0000
Date: Tue, 2 Aug 2022 16:56:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
Message-ID: <YulJQKL22sB31lfU@casper.infradead.org>
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
Cc: virtualization@lists.linux-foundation.org, mst@redhat.com,
 kernel@collabora.com, linux-doc@vger.kernel.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Aug 02, 2022 at 02:42:22PM +0200, Ricardo Ca=F1uelo wrote:
> +In this case, when the interrupt arrives :c:func:`vp_interrupt` will be
> +called and it will ultimately lead to a call to
> +:c:func:`vring_interrupt`, which ends up calling the virtqueue callback
> +function::

You don't need to use :c:func:`foo`.  You can just write foo() and the
tooling will convert it into :c:func:`foo` for you.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
