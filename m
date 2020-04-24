Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAD11B7131
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 11:50:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1AF388706;
	Fri, 24 Apr 2020 09:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqYcsdx9I2DN; Fri, 24 Apr 2020 09:50:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C87CE886EF;
	Fri, 24 Apr 2020 09:50:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C772C0175;
	Fri, 24 Apr 2020 09:50:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59B48C0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 504AE86F37
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amldBX_wFmRw
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:50:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 43B9886F17
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:50:14 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u11so9758298iow.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 02:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6dHUDskGTlpWCtHIuIBU/ej74enmuqs9QrIOjUxDxTw=;
 b=Fc3ZGVlSnmzJ5yAdalVrebHWuX6DwZBtdrXeCAQwBqVeFYoML/sfB0rFoxaGe2TWRx
 24UJMiJkhTVsM4087urCixC8qAyIQrLJsxVIgYRvAN7hlaOjA7PIHlBHk5RSeoAqIQyV
 v9o5j3qP3m9KIBgnlwcaEVQ/8Dj/MuOE3NQFPnR1mw+C719dTyj6eIMIQ6VOF3SQfUrO
 SBXMLrcs2AH9EV4KWbt6q/5g3kTDGL6erEsTia/mbv+xtGKfhtCov0puiwyRkV/WAJAN
 cLaaHlkfirMH7/UUJJkNcjpp3nROEp3zqqM3EGdn91wuC2Swzrfqt5cFbN/EWqifSZKR
 Yzbw==
X-Gm-Message-State: AGi0PuYTKIe2mxkbtnnAm1HPxmdfTvbfA/4Fu6H/9Q6DT/cUx8/gPOX7
 mN0E0zhMlRFClKvsCZp3+dZ77nDN649zgi9jWt4=
X-Google-Smtp-Source: APiQypLo8lbC1Ovo4n92FN/j46YMwq/dyCmxWua4lxqlPJfsenvQiuY5gG/RchGdG0F7d3aJexBikTqnhB//ZAoT9/Q=
X-Received: by 2002:a6b:7317:: with SMTP id e23mr7827695ioh.72.1587721813333; 
 Fri, 24 Apr 2020 02:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <1585635488-17507-1-git-send-email-chenhc@lemote.com>
 <20200331145325.f6j2jjczlz33xuyi@sirius.home.kraxel.org>
In-Reply-To: <20200331145325.f6j2jjczlz33xuyi@sirius.home.kraxel.org>
From: Huacai Chen <chenhc@lemote.com>
Date: Fri, 24 Apr 2020 17:57:37 +0800
Message-ID: <CAAhV-H6vpKk=MD3PX8r6ByT7u4fhwfUcBX6c8FGVA-D0yqm28g@mail.gmail.com>
Subject: Re: [PATCH Resend] drm/qxl: Use correct notify port address when
 creating cursor ring
To: Gerd Hoffmann <kraxel@redhat.com>
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

Hi,  Gerd

On Tue, Mar 31, 2020 at 10:53 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Mar 31, 2020 at 02:18:08PM +0800, Huacai Chen wrote:
> > The command ring and cursor ring use different notify port addresses
> > definition: QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR. However, in
> > qxl_device_init() we use QXL_IO_NOTIFY_CMD to create both command ring
> > and cursor ring. This doesn't cause any problems now, because QEMU's
> > behaviors on QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR are the same.
> > However, QEMU's behavior may be change in future, so let's fix it.
> >
> > P.S.: In the X.org QXL driver, the notify port address of cursor ring
> >       is correct.
> >
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
>
> Pushed to drm-misc-next.
It seems that this patch hasn't appear in upstream.

>
> thanks,
>   Gerd
>
Thanks,
Huacai
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
