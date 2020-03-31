Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1641998FB
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 16:53:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4560C877D3;
	Tue, 31 Mar 2020 14:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HI6VBBnhPhm; Tue, 31 Mar 2020 14:53:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A33B86AE5;
	Tue, 31 Mar 2020 14:53:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08F2EC07FF;
	Tue, 31 Mar 2020 14:53:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FE80C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1FC9F88833
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpiJrYmtuUzD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:53:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1CA8B886AF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585666418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDs6T+KryTBsmRrAElzm+mnqqyDifHGjX0HWIx3qyik=;
 b=HXPQs9tF+OJ+gaQdMskQsywqT9S7y9yckCn9cAIqxIIwH2dSzr6DzKKSNFv1nRrULMAB7X
 0ogXm8JzFqMGLb9v5xRKYJ/DlWz9vtaqBCHQ63HPt/vYuZ6pZTeomiDgb5fJfh5zbo96vl
 pwzTIug7gAtPihk9g+ugtsXh6wEecdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-hpUKDwKsMFGSk8FPm3Jkhg-1; Tue, 31 Mar 2020 10:53:30 -0400
X-MC-Unique: hpUKDwKsMFGSk8FPm3Jkhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7251005509;
 Tue, 31 Mar 2020 14:53:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4BC41001B2B;
 Tue, 31 Mar 2020 14:53:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F1E3D31F24; Tue, 31 Mar 2020 16:53:25 +0200 (CEST)
Date: Tue, 31 Mar 2020 16:53:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH Resend] drm/qxl: Use correct notify port address when
 creating cursor ring
Message-ID: <20200331145325.f6j2jjczlz33xuyi@sirius.home.kraxel.org>
References: <1585635488-17507-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585635488-17507-1-git-send-email-chenhc@lemote.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, Fuxin Zhang <zhangfx@lemote.com>,
 Dave Airlie <airlied@redhat.com>
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

On Tue, Mar 31, 2020 at 02:18:08PM +0800, Huacai Chen wrote:
> The command ring and cursor ring use different notify port addresses
> definition: QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR. However, in
> qxl_device_init() we use QXL_IO_NOTIFY_CMD to create both command ring
> and cursor ring. This doesn't cause any problems now, because QEMU's
> behaviors on QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR are the same.
> However, QEMU's behavior may be change in future, so let's fix it.
> 
> P.S.: In the X.org QXL driver, the notify port address of cursor ring
>       is correct.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
