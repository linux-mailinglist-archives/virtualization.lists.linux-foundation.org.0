Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3766823BCC2
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 16:56:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E9C03869FE;
	Tue,  4 Aug 2020 14:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wEQ+t9B-a+S; Tue,  4 Aug 2020 14:56:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 84B8B86D73;
	Tue,  4 Aug 2020 14:56:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BAFAC004C;
	Tue,  4 Aug 2020 14:56:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76A59C004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6563F85727
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SR734Pf69UaR
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CDC2385514
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596553007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMOTVo2nXPJDPcxy6Vss9JxAA8ekMj6IlI6j1pIdU+g=;
 b=hAl5pxwKVpjc5DCFvbarVFR2fBQ/0hHn/bBcENqm8t7wA2HY4Q3QZaRDnmbjee5jlX1qbA
 o8iSgVsLbxxeKNbbFRzfaLMhwG99OelSFBbUpBCJk2gEBJHaw3aobgYrM1v9UUftjv8Rs2
 92+B5PB6cBB1TdbNlMyUUE3iIbt1gJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-sgEWH1yEPLOqX6Ehiv_m2Q-1; Tue, 04 Aug 2020 10:56:42 -0400
X-MC-Unique: sgEWH1yEPLOqX6Ehiv_m2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3930E1B2C983;
 Tue,  4 Aug 2020 14:56:41 +0000 (UTC)
Received: from gondolin (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A978689501;
 Tue,  4 Aug 2020 14:56:36 +0000 (UTC)
Date: Tue, 4 Aug 2020 16:56:34 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 18/24] mlxbf-tmfifo: sparse tags for config access
Message-ID: <20200804165634.4df11c6b.cohuck@redhat.com>
In-Reply-To: <20200803205814.540410-19-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-19-mst@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Vadim Pasternak <vadimp@mellanox.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Andy Shevchenko <andy@infradead.org>
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

On Mon, 3 Aug 2020 17:00:01 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> mlxbf-tmfifo accesses config space using native types -
> which works for it since the legacy virtio native types.
> 
> This will break if it ever needs to support modern virtio,
> so with new tags previously introduced for virtio net config,
> sparse now warns for this in drivers.
> 
> Since this is a legacy only device, fix it up using
> virtio_legacy_is_little_endian for now.

I'm wondering if the driver should make this more explicit?

No issues with the patch, though.

> 
> No functional changes.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
