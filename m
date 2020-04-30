Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA51BEECF
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 05:59:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F27B3855BD;
	Thu, 30 Apr 2020 03:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgDYoJqAnxUM; Thu, 30 Apr 2020 03:59:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62A2B8779F;
	Thu, 30 Apr 2020 03:59:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46227C0172;
	Thu, 30 Apr 2020 03:59:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21948C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0309E24981
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLnS8Fllruep
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:59:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 05F2C24856
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:59:32 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id r17so30991lff.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 20:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTyT7D/aRpGtKLbN7WKp3lZYOePOoydfPi7jNodIIE0=;
 b=Z4cAmNazdgU7AmIB4Z7wsDwxa4kTOMiZH9GmdDbRhd8jJlncYaxyg5iKp6yeTnF2+1
 f1bsXVV74Px8Wvazh9EP4Ovy1+XaugnNGUQpuu3fPCV5wlqpKLkymMoj5o5Vs5KzPqE3
 cEDZmvCVGEGHJj076cqxhRV3iRMhKOjSddZykyeQHgN0nQnAqvs7rUd4jv/cpnAEm7gJ
 qmMRpC3D8rnWMPCeOwsGJ6VMcnJ9syHnrcC83JI0dqZk7xSL1HSS0DaYDImyOhGxa75K
 r+lkES4S//iY8vdv9qjCibMyuFX4TECw7aeRcDv8l4hPThutsBuONMWYZEQOqDvPMJSb
 ARZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTyT7D/aRpGtKLbN7WKp3lZYOePOoydfPi7jNodIIE0=;
 b=S48lfs7vd2KbhzBIupQjP42/y8dfg3X7Mu4NMgra02Eqndu6/dV8j6yLebh3///2IB
 aqix+q/dlRRCQ7qYWS5wAJBvP+5vGGcFQNVT56QzyIcKCrZ7kxanvwFLbTtxTcFwqpmA
 ILAXZ2wUWgLIbpKcdU4yX6EPseFDr79w9fDLMmbQLjVAR/IWdGFEEuw34hqgbGTUSE1U
 kWfEboiQEfqVKbZHrMWJu4Jhtoz25Yz+8uIyq5U5lMlazfZ0l+b1BLdq1awelRKeeLJw
 LJdgMGYQQRIe12KVjVIOmh50kxXI+Tq9nqKMnBprb7I+yGcWA6HN4hnVv5B6FE68UkJL
 bHhA==
X-Gm-Message-State: AGi0PubOm/rQmQYX+qBhlASepsvQCc4O4GWpnfqIjNjpasA/woCFASEU
 ko3U84sag8BO6+QZjXl9h6tIcHg2Bw0y/AH8lFM=
X-Google-Smtp-Source: APiQypJtTn9HE9gvw/LyJ4y/lnqaa5/YJfCAqTzJkdsQVjZBsB9/TE6Oj8nrC+KRk9LHsOFw5Ak2Z/k6WDuD0ths2WI=
X-Received: by 2002:a19:9109:: with SMTP id t9mr762786lfd.10.1588219169985;
 Wed, 29 Apr 2020 20:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200428204729.64569-1-ytht.net@gmail.com>
 <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
 <20200429115836.u5vqt3s6l4wcejjd@sirius.home.kraxel.org>
In-Reply-To: <20200429115836.u5vqt3s6l4wcejjd@sirius.home.kraxel.org>
From: lepton <ytht.net@gmail.com>
Date: Wed, 29 Apr 2020 20:59:18 -0700
Message-ID: <CALqoU4wHbkqVx2WiF4ieZ1Bg6DE5OWzzUGrQbe8EYsO8ruq3Xg@mail.gmail.com>
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

On Wed, Apr 29, 2020 at 4:58 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > 3) Need to be verbose on how the vring processing work in the commit log of
> > patch 1
>
> Ecven better a file documenting the interface somewhere in
> Documentation/
I put a uvirtio-vga.c under samples/uvirtio and hope this can serve
the purpose of the document since currently that's the only tested use
case. Maybe have a document later if this really get more use cases?
Thanks.
>
> take care,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
