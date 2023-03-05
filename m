Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 869ED6AAEE2
	for <lists.virtualization@lfdr.de>; Sun,  5 Mar 2023 10:54:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03147403AE;
	Sun,  5 Mar 2023 09:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03147403AE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frZEOw7t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQHzv2bbWIyR; Sun,  5 Mar 2023 09:54:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE59A40227;
	Sun,  5 Mar 2023 09:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE59A40227
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E61A1C007F;
	Sun,  5 Mar 2023 09:54:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 305AAC0032
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Mar 2023 09:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17AB260BDD
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Mar 2023 09:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17AB260BDD
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=frZEOw7t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfqhwKWhvC7w
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Mar 2023 09:54:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E15E60BB0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E15E60BB0
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Mar 2023 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678010045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zZ1FRbEzDhg7eiI4sxCa3iFgs3/LMEjHpvregVmhCSg=;
 b=frZEOw7tGhYHFMuUwPJpmgvB5kENa87clBxOBlT3YVfd0PKk4HrWAqoogAJj9T5CFoFBff
 GJsz0qw9SgnXVSG5+yhHQ6YkNlNiv/mH4vP429egBwZhY2QcPZ/84uIntfkIo2vtAwjH9u
 CvMgoI3lJ8FcZ4G0L6UYHyTxhJMgvjI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-reRZ69XWO1Gzk_nDe6CuOA-1; Sun, 05 Mar 2023 04:54:03 -0500
X-MC-Unique: reRZ69XWO1Gzk_nDe6CuOA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so2592023wms.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Mar 2023 01:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678010042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZ1FRbEzDhg7eiI4sxCa3iFgs3/LMEjHpvregVmhCSg=;
 b=O+t6NPWMlmWMgqYovR7AAgwOPNUfIKYnXnHunpJanUk5ZJsDAtHs/IH0oHj5FUvbLN
 hf+vYSR8B5SYti6Tsgpmq3uyRSpKzOUk22mal+Kagl4y0dt6btrRKx2Vf0oQ3E3XYIik
 3rHYHnN+Pfwq1VM7cp1zrDsLj5wGjCUVe3zzwOVHlx7TdyR/VnomevVoMoKH4NaPMTVL
 6DiJlbvq9VvLVW4Nd2MshEqurhKkHcOcxT1n7nOc+P4LKu1rCBdGeM7WvpY5mpoETsOm
 AylE5Tk79Oafb9307YUFU+/fCHeIy4/fxDMlYQbnvNli3IUBcG0eqVcj0TmiPeo15l75
 MUHQ==
X-Gm-Message-State: AO0yUKWYEYU1Z3PiuxFnpvsfVSW3p/JMvUBck32Xe5pPqWsWL243CNhy
 PFUiPudWH52dNclHNm3eK7XKNN0KSjALwOrFg7/NhahAnuPso7wZuhHY/JzSE51iX2SFOm9f32Z
 BDpn8HdKvD9xurqtajVQE3bwToaLMUfFYyjq2Q0PubQ==
X-Received: by 2002:adf:fc0d:0:b0:2c7:1e3b:2d46 with SMTP id
 i13-20020adffc0d000000b002c71e3b2d46mr4900205wrr.17.1678010042431; 
 Sun, 05 Mar 2023 01:54:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8IoOS6Gx/WJKStkNGfdBuK7UXUinqGFeitKJGyU7CYQyNcgwXAwkQ7nJs7SEFHzH1aVenCxA==
X-Received: by 2002:adf:fc0d:0:b0:2c7:1e3b:2d46 with SMTP id
 i13-20020adffc0d000000b002c71e3b2d46mr4900192wrr.17.1678010042180; 
 Sun, 05 Mar 2023 01:54:02 -0800 (PST)
Received: from redhat.com ([2.52.23.160]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d66c8000000b002c573a6216fsm6984304wrw.37.2023.03.05.01.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 01:54:01 -0800 (PST)
Date: Sun, 5 Mar 2023 04:53:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v3] virtio-net: Fix probe of virtio-net on kvmtool
Message-ID: <20230305045249-mutt-send-email-mst@kernel.org>
References: <20230223-virtio-net-kvmtool-v3-1-e038660624de@rivosinc.com>
 <20230301093054-mutt-send-email-mst@kernel.org>
 <CACGkMEsG10CWigz+S6JgSVK8XfbpT=L=30hZ8LDvohtaanAiZQ@mail.gmail.com>
 <20230302044806-mutt-send-email-mst@kernel.org>
 <20230303164603.7b35a76f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230303164603.7b35a76f@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 rbradford@rivosinc.com, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Fri, Mar 03, 2023 at 04:46:03PM -0800, Jakub Kicinski wrote:
> On Thu, 2 Mar 2023 04:48:38 -0500 Michael S. Tsirkin wrote:
> > > Looks not the core can try to enable and disable features according to
> > > the diff between features and hw_features
> > > 
> > > static inline netdev_features_t netdev_get_wanted_features(
> > >         struct net_device *dev)
> > > {
> > >         return (dev->features & ~dev->hw_features) | dev->wanted_features;
> > > }
> > 
> > yes what we do work according to code.  So the documentation is wrong then?
> 
> It's definitely incomplete but which part are you saying is wrong?

So it says:
  2. netdev->features set contains features which are currently enabled
     for a device.

ok so far.
But this part:

  This should be changed only by network core or in
     error paths of ndo_set_features callback.

seems to say virtio should not touch netdev->features, no?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
