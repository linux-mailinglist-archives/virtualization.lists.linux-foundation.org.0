Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3923BC4D
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 16:36:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 632A122658;
	Tue,  4 Aug 2020 14:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCKiT3-kAfjN; Tue,  4 Aug 2020 14:36:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5681122668;
	Tue,  4 Aug 2020 14:36:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3527EC004C;
	Tue,  4 Aug 2020 14:36:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DB44C004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F04362263C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3m1JytLa7re
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:36:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 741982262E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596551783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7efH4yIOHHW4g8YMjqbBd8yHqYmQidXMPn5y6gvFuc=;
 b=LjMnwEeUJ9ifX6WkFepNBhzhulWsOOj0lMFnSqQP70AW9OREfgy4sltY6iNnYCx7f/hg59
 O8bvqlRuhFwq8P3MatnAvC1ZbOuE9/AjKVCM838uDQ539wYYQ7yh3SQdbpuCTQRivt01D2
 MT8A2NSbv0JCHAjv+IIztTO9H1z5lqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Trw6BIZsOj27-smuFfkV2Q-1; Tue, 04 Aug 2020 10:36:18 -0400
X-MC-Unique: Trw6BIZsOj27-smuFfkV2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CA0C193F565;
 Tue,  4 Aug 2020 14:36:17 +0000 (UTC)
Received: from gondolin (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18BF461176;
 Tue,  4 Aug 2020 14:36:13 +0000 (UTC)
Date: Tue, 4 Aug 2020 16:36:10 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 12/24] virtio_iommu: correct tags for config space
 fields
Message-ID: <20200804163610.48bb7947.cohuck@redhat.com>
In-Reply-To: <20200803205814.540410-13-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-13-mst@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Mon, 3 Aug 2020 16:59:27 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> Since this is a modern-only device,
> tag config space fields as having little endian-ness.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/uapi/linux/virtio_iommu.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
