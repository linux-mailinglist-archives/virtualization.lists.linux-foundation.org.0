Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 061597A7A06
	for <lists.virtualization@lfdr.de>; Wed, 20 Sep 2023 13:07:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1471E4181D;
	Wed, 20 Sep 2023 11:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1471E4181D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOXI5+AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dkZ8jAJ5V12f; Wed, 20 Sep 2023 11:07:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 88D39417FF;
	Wed, 20 Sep 2023 11:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88D39417FF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5706C008C;
	Wed, 20 Sep 2023 11:06:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C564C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Sep 2023 11:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D536741F1E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Sep 2023 11:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D536741F1E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOXI5+AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKP-ZeQtZ55n
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Sep 2023 11:06:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0AF141EF3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Sep 2023 11:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0AF141EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695208015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfDCNnVKo1svwadEk9oIfDB+2esqrYhApxIidnLEY88=;
 b=bOXI5+ADhqX1TIyiSRuPOm+TaqNsCYmpx2PIA014khr13D2+MVXUX4Igj8a47VpizorWSQ
 Pv3yPVTIKZeEKv6izPbDZrkDL3HAkBWCAxSKO1ovKH1ae9Erka67c9FTB6Ya3qAnfvgImO
 KmRTLLe/hBYeZyqBmKS1+DK+O0iI31w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-3U8EJfpbN_WzjLphyDB0cQ-1; Wed, 20 Sep 2023 07:06:52 -0400
X-MC-Unique: 3U8EJfpbN_WzjLphyDB0cQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-405004757dfso12985305e9.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Sep 2023 04:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695208011; x=1695812811;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cfDCNnVKo1svwadEk9oIfDB+2esqrYhApxIidnLEY88=;
 b=OLo0wUV2CfxX1pdxjTeTHZpQKLNEIMJ/s7rfxuOiIVuJI9kdZaC0AurZVA0guZbuMc
 c1JsdtyIZVPkj105PaDLTk7bNiPjw2V8BXaZ+j489nj8pHK58I65L9nkVgrvrSDB6W49
 /urpeZC2aAsoCIxATT0dJ6RfTS9vdkBgqAmmDs1iClBwWd7ObdbJZC4fuo7BmxtO9qyp
 EZSlPhLQyEkRar4IYMEvbx11zUNnMV7UI7wgla/uGD0JvSQEMok0i77tmUDExoy3oLHg
 g/2P6i+d3atGw1+f0+VdPFyPGy7J/vVKY4TJx+P52uBd7Q/cVlDjDRIspe+GojcVlbzt
 HbjQ==
X-Gm-Message-State: AOJu0Yx76cTGqBRXh4f7xPPm/YdW7x/m2DjmoaTl3YBKv4WesLlVfvaP
 4uXxxp9TD5Go/tgquGcylQEQFND7dkcWxvnyD6l005LedSf/7mHDwnigumV9YSBXZ03fcIUNgNL
 kO97e4iiFWe/oWFbYVw+X2TG9UiehMNGs7xzlp2KgyQ==
X-Received: by 2002:a05:600c:358d:b0:401:b53e:6c3e with SMTP id
 p13-20020a05600c358d00b00401b53e6c3emr2246214wmq.1.1695208011285; 
 Wed, 20 Sep 2023 04:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQai1hDlcW1xi3A9mCJ3IVLesx5xOiB+d9PQpepYxX8c8mzd0ejadrsxaFt3WWy0dIOq2VYg==
X-Received: by 2002:a05:600c:358d:b0:401:b53e:6c3e with SMTP id
 p13-20020a05600c358d00b00401b53e6c3emr2246193wmq.1.1695208010924; 
 Wed, 20 Sep 2023 04:06:50 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-242-56.dyn.eolo.it.
 [146.241.242.56]) by smtp.gmail.com with ESMTPSA id
 g33-20020a05600c4ca100b004051d5b2cf1sm1645878wmp.12.2023.09.20.04.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 04:06:50 -0700 (PDT)
Message-ID: <f1198daa6d068c76b8ce692ad313698c34d0d1a3.camel@redhat.com>
Subject: Re: [PATCH net-next v9 0/4] vsock/virtio/vhost: MSG_ZEROCOPY
 preparations
From: Paolo Abeni <pabeni@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>
Date: Wed, 20 Sep 2023 13:06:48 +0200
In-Reply-To: <20230919223700-mutt-send-email-mst@kernel.org>
References: <20230916130918.4105122-1-avkrasnov@salutedevices.com>
 <b5873e36-fe8c-85e8-e11b-4ccec386c015@salutedevices.com>
 <yys5jgwkukvfyrgfz6txxzqc7el5megf2xntnk6j4ausvjdgld@7aan4quqy4bs>
 <a5b25ee07245125fac4bbdc3b3604758251907d2.camel@redhat.com>
 <hq67e2b3ljfjikvbaneczdve3fzg3dl5ziyc7xtujyqesp6dzm@fh5nqkptpb4n>
 <20230919223700-mutt-send-email-mst@kernel.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Bobby Eshleman <bobby.eshleman@bytedance.com>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, Arseniy Krasnov <avkrasnov@salutedevices.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Eric Dumazet <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, kernel@sberdevices.ru,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

On Tue, 2023-09-19 at 22:38 -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 19, 2023 at 03:35:51PM +0200, Stefano Garzarella wrote:
> > On Tue, Sep 19, 2023 at 03:19:54PM +0200, Paolo Abeni wrote:
> > 
> > > DaveM suggests this should go via the virtio tree, too. Any different
> > > opinion?
> > 
> > For this series should be fine, I'm not sure about the next series.
> > Merging this with the virtio tree, then it forces us to do it for
> > followup as well right?
> > 
> > In theory followup is more on the core, so better with net-next, but
> > it's also true that for now only virtio transports support it, so it
> > might be okay to continue with virtio.
> > 
> > @Michael WDYT?
> > 
> > Thanks,
> > Stefano
> 
> I didn't get DaveM's mail - was this off-list?

Yes, that was off-list co-ordination.

> I think net-next is easier because the follow up belongs in net-next.
> But if not I can take it, sure. Let me know.

Since there is agreement on that route, we will take it (likely
tomorrow).

Cheers,

Paolo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
