Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9393E8827
	for <lists.virtualization@lfdr.de>; Wed, 11 Aug 2021 04:47:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5436F40471;
	Wed, 11 Aug 2021 02:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rU3MuHubLgq9; Wed, 11 Aug 2021 02:47:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E95FF40336;
	Wed, 11 Aug 2021 02:47:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43270C000E;
	Wed, 11 Aug 2021 02:47:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4854C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 02:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DA4640471
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 02:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiJ7JRH8dxAv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 02:47:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81AD2402B4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 02:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628650035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIce2B+/4HbL5jF0ykq2fh3kdWSfEeXYGImK/r7s/Ws=;
 b=cYcjlj9/LyTUgf1KnRGbjFQRdMjk5ofgDje4g2wcI6ZSvMckGVHA0g+zwb3uZgE5SwMIow
 6mUuu3WzUK6M8HbZUrTvo5BhTaJHh1ZLejQqGtbw1EdlaiMdIbRepfQVgPmYgTazetM5Ph
 h/kl5vguXnaNSkYrbxE0VZJJ940iTMs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-O7TRepuvOS-PkcM3JsxclA-1; Tue, 10 Aug 2021 22:47:12 -0400
X-MC-Unique: O7TRepuvOS-PkcM3JsxclA-1
Received: by mail-lf1-f71.google.com with SMTP id
 x3-20020a19e0030000b02903c25cedaef5so361253lfg.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 19:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIce2B+/4HbL5jF0ykq2fh3kdWSfEeXYGImK/r7s/Ws=;
 b=kK1hIx3+Wh5TNbarMBBR5bR1CGEHvRYH8LsiPZJwcelSgVMrdcLrLMKunGVB1Zf53e
 1rnVGpiKeEosleQRM9voTVjODflcfbKOVMsRa0GCeQlB4WqI05+cxs8MUASBYOIUPeM5
 dUtQ7iY4asfawtV22zBo1Vn/K9ygq1xDUBsxg8m0R6SFJul2Nr+ywasO9brtvSdJfHkz
 BVGKnurGWqBxGauUB6cEJ6IrmoAsHoUD4qdx/G7OVwNWUTzPCLF8pr6kStqsPefXcEiZ
 RNNjBaxWqY6/bZrRjhvObll7WsojcR94cbFSw6CxZ12wCpZBJ/DzRfvvlN1fOdcTGl0/
 6RLA==
X-Gm-Message-State: AOAM533kS1LtI1TWA+JDLOdTANIG/SBGzFwK2U8jmmmrwMq53ChQ7Taz
 OJr0te8Jt0W1kx50nX7x3zzbDNgr8neYDUi1InSHvkr+g70MhCoE9u4PAcmqlJHYFLOSp/iKKG4
 iVhb2muW8Ka+9FUdyxTj7Rp3VjhG0n3OjkRWkCixxnDaJyQn4QDsaxKHN/w==
X-Received: by 2002:a05:6512:303:: with SMTP id
 t3mr24012196lfp.312.1628650030745; 
 Tue, 10 Aug 2021 19:47:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPOI/frUnhNmX2fQGtc/ThrZrUlUk7XJbx206+F97TvqT61jaFMYpK/ZiAQKWkzYtku6/UbcAntx9PtdPp9HM=
X-Received: by 2002:a05:6512:303:: with SMTP id
 t3mr24012185lfp.312.1628650030560; 
 Tue, 10 Aug 2021 19:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <kcEE.bHGiwBQkSjiyj736PwuvRg.gH8aaNCN1wE@kopano-be-01.sos.tu-berlin.de>
In-Reply-To: <kcEE.bHGiwBQkSjiyj736PwuvRg.gH8aaNCN1wE@kopano-be-01.sos.tu-berlin.de>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Aug 2021 10:46:59 +0800
Message-ID: <CACGkMEtr+AWjPRw=Yv4eQOCdGaqb-XPBMPm6F1E76X7W1FmBGQ@mail.gmail.com>
Subject: Re: virtio bugs
To: "Hetzelt, Felicitas" <f.hetzelt@tu-berlin.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: virtualization <virtualization@lists.linux-foundation.org>,
 "david.kaplan@amd.com" <david.kaplan@amd.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>
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

On Tue, Aug 10, 2021 at 6:18 PM Hetzelt, Felicitas
<f.hetzelt@tu-berlin.de> wrote:
>
> Hello,

Adding virtualization-list.

Thanks a lot for those reports. I can spend some time fixing those
bugs but if anyone wants to do that, it's also welcomed.


>
> below are a few more untrusted hypervisor bugs in virtio drivers (kernel version 5.10.0-rc6) . This is olny relevant for protected VM execution under TDX or SEV.
>
>
> virtio_balloon: https://github.com/fuzzsa/fuzzsa-bugs/blob/master/virtio_balloon.md
> virtio_blk: https://github.com/fuzzsa/fuzzsa-bugs/blob/master/virtio_blk.md
> virtio_console: https://github.com/fuzzsa/fuzzsa-bugs/blob/master/virtio_console.md
> virtio_crypto: https://github.com/fuzzsa/fuzzsa-bugs/blob/master/virtio_crypto.md
> virtio_rng: https://github.com/fuzzsa/fuzzsa-bugs/blob/master/virtio_rng.md
>
> Let me know if you need any additional information. Also feel free to forward this mail, in case I forgot to cc relevant people.
>
> Regards,
> Felicitas
>
>
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
