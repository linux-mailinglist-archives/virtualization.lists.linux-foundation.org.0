Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA828CAAA
	for <lists.virtualization@lfdr.de>; Tue, 13 Oct 2020 10:54:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF4EC87B39;
	Tue, 13 Oct 2020 08:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7b5WwAKveUe; Tue, 13 Oct 2020 08:54:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6401486E41;
	Tue, 13 Oct 2020 08:54:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F179C0051;
	Tue, 13 Oct 2020 08:54:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6B10C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 08:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AF227275A5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 08:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hy1yUBq6szo9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 08:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id E7DF6231A0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602579273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tTorjtxCCUYn5sxnNn2sovTqfPXPpVXvu20v4jV0oXg=;
 b=gnXM+lYZyxe6FqO5ooX1wSxFUPZmnV/HczcnGuj/6T8Qtg71Zy5BmoHu76IN65VdEHZPqn
 Nfa2/3g0JrzrAvNzV9mrjnDJvbD5ftprVxFmXj/zpUTl/yf9HcFLPZFJXx68uJl9gKW2hs
 Qh2yRipn1yX0+VviGB5vXMypOTiwW9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-Gxl_QddkMduWKTo0LWE3dA-1; Tue, 13 Oct 2020 04:54:32 -0400
X-MC-Unique: Gxl_QddkMduWKTo0LWE3dA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC61E8030A9;
 Tue, 13 Oct 2020 08:54:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B62C5D9CD;
 Tue, 13 Oct 2020 08:54:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7DD781750A; Tue, 13 Oct 2020 10:54:25 +0200 (CEST)
Date: Tue, 13 Oct 2020 10:54:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] drm/virtio: Use UUID API for importing the UUID
Message-ID: <20201013085425.camu3bajxi4jaldo@sirius.home.kraxel.org>
References: <20201012171826.76509-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201012171826.76509-1-andriy.shevchenko@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
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

On Mon, Oct 12, 2020 at 08:18:26PM +0300, Andy Shevchenko wrote:
> There is import_uuid() function which imports u8 array to the uuid_t.
> Use it instead of open coding variant.
> 
> This allows to hide the uuid_t internals.

Doesn't apply to drm-misc-next, please rebase.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
