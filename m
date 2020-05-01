Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6C1C0B6B
	for <lists.virtualization@lfdr.de>; Fri,  1 May 2020 02:59:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4644E882B3;
	Fri,  1 May 2020 00:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igxB7V-bBrTW; Fri,  1 May 2020 00:59:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A39B6882BB;
	Fri,  1 May 2020 00:59:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89D0FC016F;
	Fri,  1 May 2020 00:59:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24D07C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 00:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 13204882B3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 00:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsOquAbkH8sU
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 00:59:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 16B9288293
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 00:59:19 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id g4so1365089ljl.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 17:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+S7oL7QtB7K5iAdk2XkCCMfKsTFMb8A5w0sQgUiYH4=;
 b=fx5NfI2UAwxAnXvHkLW7MrPDKWrr4E4/bxgGBVWBEGad2Xsnp57cjfub9gOPjYKrPH
 e4t5BOI6/yYfFjkL9mT2cPaO4UCBAwIEd5RoJxCGvk5EA9/Oxqf8ItlzmXv5h7+LWpRp
 y4UeN4gBnHr0bcFZMKR/hf3PJGD9q4PcrOpa20LSH1vksuL3Jlg1notz+/FxPjxiDhp5
 3p2+Mv8SHhH24kIZysfHAS8JTBH6uT83LhP7nv66M24Vy2GWGcXQ/8U+SqdRxzbDBSO1
 Osuz5j4auzHfS2oHg3Isn0dAu9ZIbBd7ftmvoBXZc/cR6OkXoAMAxHBqiWqmKk9PRUsK
 y1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+S7oL7QtB7K5iAdk2XkCCMfKsTFMb8A5w0sQgUiYH4=;
 b=ByP/x7eRuz2nobUY8bRf7D9J1XV2tr/IvX46igKscX9KxSCrU0jqVbpdsN5OjMNJsh
 4Y9hiti+qg35sotThJgb0z9jr+QuMp/pMY4rtrTwoRUbBDeKV1847qYuaAdX+RynxKLJ
 Xa+jzThyhxiHi86tbWmuYc03huTbQmezFW7JyZSgmM/ruMewDwQgGwZTrUjUVvLvgODf
 OJTpR9OaoCNO5kFBIaTEu/S7PIBh7TiJ72sJulfhIzcD4i1MlXbhQ9UHB1WZBuwVBXbc
 8hZDqayCuFgAJoDEJgtQreDYyQVCajaA50+e0M2PZrFBiX2lUa15PSVSMY9Pz79SV1sR
 jQhQ==
X-Gm-Message-State: AGi0PuYDqsnLnypS8KxDbnFCXZlrSWgYW88m8E3PbstoxqDHyOkvQzni
 jjxlDG9jmgLEsSHT1tyYHqJBMGuSHpnXQrmEwA8=
X-Google-Smtp-Source: APiQypIXup8wLrpQuJ15rPeA3tr18vQb8135DQXhC4YrLTM7CyiP9jQ6fdT4lzU7oD3PEaZ4kPMoluM9mvrDHISpcr8=
X-Received: by 2002:a05:651c:1058:: with SMTP id
 x24mr973255ljm.39.1588294757012; 
 Thu, 30 Apr 2020 17:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200428204729.64569-1-ytht.net@gmail.com>
 <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
 <20200429115836.u5vqt3s6l4wcejjd@sirius.home.kraxel.org>
 <CALqoU4wHbkqVx2WiF4ieZ1Bg6DE5OWzzUGrQbe8EYsO8ruq3Xg@mail.gmail.com>
 <20200430075141.kjldxjhylwo347bf@sirius.home.kraxel.org>
In-Reply-To: <20200430075141.kjldxjhylwo347bf@sirius.home.kraxel.org>
From: lepton <ytht.net@gmail.com>
Date: Thu, 30 Apr 2020 17:59:05 -0700
Message-ID: <CALqoU4wfqPcOkdiWBTC4j=_U2q6gUFn5JkZsgPXr0MM4s6ZqLQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] Add uvirtio for testing
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org
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

On Thu, Apr 30, 2020 at 12:51 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Apr 29, 2020 at 08:59:18PM -0700, lepton wrote:
> > On Wed, Apr 29, 2020 at 4:58 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > > 3) Need to be verbose on how the vring processing work in the commit log of
> > > > patch 1
> > >
> > > Ecven better a file documenting the interface somewhere in
> > > Documentation/
> > I put a uvirtio-vga.c under samples/uvirtio and hope this can serve
> > the purpose of the document since currently that's the only tested use
> > case.
>
> Sample code is good, but *commented* sample code would be better.
>
> > Maybe have a document later if this really get more use cases?
>
> Well, having good documentation right from the start would help getting
> more use cases ;)
Now I add document in V3.

Thanks. Regards
>
> take care,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
