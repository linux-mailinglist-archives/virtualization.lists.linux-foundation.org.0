Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3823BC99
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 16:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F1C5986203;
	Tue,  4 Aug 2020 14:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RraCVfD_1dO; Tue,  4 Aug 2020 14:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 945968626C;
	Tue,  4 Aug 2020 14:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83F8DC004C;
	Tue,  4 Aug 2020 14:48:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C526C004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2848687C8C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-Nb54Lldxw5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:48:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D1416859ED
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596552498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBIyByaoXzguOGwDoIHrGafwWHoBGZfxem7IPfKZXe8=;
 b=clT4qRSq4qZzbtfO34shifMRhD44twX3oDgBjcCYySyYjEjKKiHPIphTlxily4Bv3L66Fd
 m3qvJpNsTZIxGVcxe/uQsEZ6yOtoJZicO1zMjsRlq2tEDxbGobAwYyv+3K/BmXGzp+Cl3i
 pl7cZiiaFzsD9yaZc6a/TH0w7eG7w8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-RaUk-LvzPUWyQ7VHi_vXow-1; Tue, 04 Aug 2020 10:48:16 -0400
X-MC-Unique: RaUk-LvzPUWyQ7VHi_vXow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86D97800474;
 Tue,  4 Aug 2020 14:48:15 +0000 (UTC)
Received: from gondolin (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B56528559;
 Tue,  4 Aug 2020 14:48:08 +0000 (UTC)
Date: Tue, 4 Aug 2020 16:48:05 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 16/24] virtio_scsi: correct tags for config space fields
Message-ID: <20200804164805.656bf752.cohuck@redhat.com>
In-Reply-To: <20200803205814.540410-17-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-17-mst@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "Martin K.
 Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Mon, 3 Aug 2020 16:59:45 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> Tag config space fields as having virtio endian-ness.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/scsi/virtio_scsi.c       |  4 ++--
>  include/uapi/linux/virtio_scsi.h | 20 ++++++++++----------
>  2 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
