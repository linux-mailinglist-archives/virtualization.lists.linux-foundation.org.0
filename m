Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2776544A5
	for <lists.virtualization@lfdr.de>; Thu, 22 Dec 2022 16:55:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7651E60C1C;
	Thu, 22 Dec 2022 15:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7651E60C1C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=EAlNqUp4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fs21czGVhIg2; Thu, 22 Dec 2022 15:55:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3029560773;
	Thu, 22 Dec 2022 15:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3029560773
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6ABCAC007C;
	Thu, 22 Dec 2022 15:55:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDF15C0070
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 15:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B81FF416D0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 15:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81FF416D0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=EAlNqUp4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgEwzcbeFzRW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 15:55:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88D0E408FE
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88D0E408FE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 15:55:38 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 130so1502501pfu.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RVaV7gXLAFZP6vBGDynJRLj4x0H9TKcM19ib2OhgZ/w=;
 b=EAlNqUp4R98KPIi17pVdCnGeg5YLtNQ9E22YaC1IFqgL+oNc1/lrrzl9VI+JoE13lK
 VjR+L7aPwZEWakcgUqLmXMSQGZRe1ByvOVnPjx0FkqCB0YAvQ7g/QYD/oKpltY7og9uh
 fj46XAgcvN9T82QeRZ5TYiGWzLt1NDC0/jcMQbA9nah/zSLLM65bkL3BEYwGTTT7JE+E
 fRlmfJcYb3OfKXRLNLFyF4BtRo8cQ20YymZrzvB0pjm3rlMM1g90MHpr4pb/vujzl5KI
 RnxT1tJKm6B06dpjlVt6MNAwhdgkmhFEuC/piaLlUHv3zKIhCnj8rgzUXt+u0NHtQ6be
 E5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVaV7gXLAFZP6vBGDynJRLj4x0H9TKcM19ib2OhgZ/w=;
 b=W5gm6ExeI7LlRKo4QLEvHFLGXOJeevWTboslsPrfS2IUymRtY0MzNqd8QWriNimHS8
 tyVkhrq+FUzMfPaQnGSQVVg6mBBoglWp+ZdXvP9jW+H4IdsFrcczgRG7qgiOy9kMOcuq
 W1LjtOddD9zHl4YZzPn7NPHX5CNWQ0RGwKMTxGmeNEQeor2PthfnS1bwROX5ZCgaTyS4
 spYUBYaT7N8XHrzy5DPnz7lRq5NciggO5J9WD7T1tkHExaiqNdY9XwxVk9QN5iT039hA
 ZFoNgkU9QvQBsu3Z/quv5TtvpZYrX/Rd6oN3Yua0JwBWU+s9wsU211TpoAb/4oQgQ7Ez
 UQIA==
X-Gm-Message-State: AFqh2krr6lVW8JxULam8mY+8lr/rmP+SsTLLrwqTuvrt335UWgDEax4E
 OwIXdGFEblMdREHC5Dnxj1N6+RS69/cOQiEeQJaZTw==
X-Google-Smtp-Source: AMrXdXvFRr7/qzMUTbWIbPlyXiSK1LlPeSwNSmbVaA49P8mvF4F6AzosMjY/nVV12nHcybLxRklk9IDiMv161RPdSo4=
X-Received: by 2002:a63:40c5:0:b0:489:17a2:a53d with SMTP id
 n188-20020a6340c5000000b0048917a2a53dmr317357pga.255.1671724537702; Thu, 22
 Dec 2022 07:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20221222060427.21626-1-jasowang@redhat.com>
 <20221222060427.21626-5-jasowang@redhat.com>
 <CAJs=3_D6sug80Bb9tnAw5T0_NaL_b=u8ZMcwZtd-dy+AH_yqzQ@mail.gmail.com>
 <CACGkMEv4YxuqrSx_HW2uWgXXSMOFCzTJCCD_EVhMwegsL8SoCg@mail.gmail.com>
In-Reply-To: <CACGkMEv4YxuqrSx_HW2uWgXXSMOFCzTJCCD_EVhMwegsL8SoCg@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu, 22 Dec 2022 17:54:59 +0200
Message-ID: <CAJs=3_Akv1zoKy_HARjnqMdNsy_n34TzzGA6a25xrkF2rCnqwg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] virtio-net: sleep instead of busy waiting for cvq
 command
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 edumazet@google.com, maxime.coquelin@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net
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

My point is that the device may complete the control command after the timeout,
so, if I'm not mistaken, next time we send a control command and call
virtqueue_wait_for_used we'll get the previous response.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
