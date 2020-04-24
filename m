Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E61B7158
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 11:59:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D335F86581;
	Fri, 24 Apr 2020 09:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ficv-Sv5REcm; Fri, 24 Apr 2020 09:58:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF96086416;
	Fri, 24 Apr 2020 09:58:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7FD9C0175;
	Fri, 24 Apr 2020 09:58:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBB59C0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B63F62012D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id teAfcbmgeLU9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:58:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 904062010A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587722333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JE79+wofZ/vQi9Js/RC7p80m+SKhfKiuI320PsFcIa4=;
 b=SG471ytKzHZRA3rkH9X27/BUiCgS9X1IexjeF3SBEPzVkHkMoTuaVLrnY06j9vGTWAGpck
 bFJMyGnh5+cyGT5Wfhl4ra/76mieY7Had3KBzofTgx7jm/cC+OQFFtIY46f3wZzelWGAD/
 ELnJE2wQfE9BA50eC0V1DWuOmf1/wc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-TV-a6NB1PyuqHbYkyB7JEA-1; Fri, 24 Apr 2020 05:58:46 -0400
X-MC-Unique: TV-a6NB1PyuqHbYkyB7JEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C288D107ACF2;
 Fri, 24 Apr 2020 09:58:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EE445C1D0;
 Fri, 24 Apr 2020 09:58:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4AD0A9D98; Fri, 24 Apr 2020 11:58:43 +0200 (CEST)
Date: Fri, 24 Apr 2020 11:58:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH Resend] drm/qxl: Use correct notify port address when
 creating cursor ring
Message-ID: <20200424095843.owgjzaxdfkzr5ahk@sirius.home.kraxel.org>
References: <1585635488-17507-1-git-send-email-chenhc@lemote.com>
 <20200331145325.f6j2jjczlz33xuyi@sirius.home.kraxel.org>
 <CAAhV-H6vpKk=MD3PX8r6ByT7u4fhwfUcBX6c8FGVA-D0yqm28g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhV-H6vpKk=MD3PX8r6ByT7u4fhwfUcBX6c8FGVA-D0yqm28g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Dave Airlie <airlied@redhat.com>, Fuxin Zhang <zhangfx@lemote.com>,
 spice-devel@lists.freedesktop.org, stable <stable@vger.kernel.org>,
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

On Fri, Apr 24, 2020 at 05:57:37PM +0800, Huacai Chen wrote:
> Hi,  Gerd
> 
> On Tue, Mar 31, 2020 at 10:53 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Tue, Mar 31, 2020 at 02:18:08PM +0800, Huacai Chen wrote:
> > > The command ring and cursor ring use different notify port addresses
> > > definition: QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR. However, in
> > > qxl_device_init() we use QXL_IO_NOTIFY_CMD to create both command ring
> > > and cursor ring. This doesn't cause any problems now, because QEMU's
> > > behaviors on QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR are the same.
> > > However, QEMU's behavior may be change in future, so let's fix it.
> > >
> > > P.S.: In the X.org QXL driver, the notify port address of cursor ring
> > >       is correct.
> > >
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >
> > Pushed to drm-misc-next.
> It seems that this patch hasn't appear in upstream.

Was probably to late for the 5.7 merge window, should land in 5.8

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
