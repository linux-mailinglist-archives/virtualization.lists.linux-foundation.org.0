Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0142D7A1E3A
	for <lists.virtualization@lfdr.de>; Fri, 15 Sep 2023 14:15:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E006B83BD7;
	Fri, 15 Sep 2023 12:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E006B83BD7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWKJ8khR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbw7sdXH_7TY; Fri, 15 Sep 2023 12:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B6CF283BD6;
	Fri, 15 Sep 2023 12:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6CF283BD6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 214E9C0DD3;
	Fri, 15 Sep 2023 12:15:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78FE0C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Sep 2023 12:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5025A420E7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Sep 2023 12:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5025A420E7
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWKJ8khR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skvxRoSE5_52
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Sep 2023 12:15:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06CEB420E5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Sep 2023 12:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06CEB420E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694780098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ACgwXt5WGrX2j4PYTtUkL9OiFfodaBbXHcP278ZXTG8=;
 b=FWKJ8khRHK+KtxfXeADy6cTK1qSIphHRAu1CfVEslkmm9wTn8LACsMO+GSuk5sCgby5qVx
 m6DwNRNT9QYdrcBwPXdC2PmTweT3cMqw+5v5McUhtIMrHuPqs0f2bo18govVVEV5HbBZVA
 AfmcRrGfJTRAiM0DnjSCuOp3+y2lDMg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42--VREnqyOO_y3PJOayKeWDw-1; Fri, 15 Sep 2023 08:14:57 -0400
X-MC-Unique: -VREnqyOO_y3PJOayKeWDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so15408895e9.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Sep 2023 05:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694780096; x=1695384896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ACgwXt5WGrX2j4PYTtUkL9OiFfodaBbXHcP278ZXTG8=;
 b=G4RDW7zgH2nl3RKjDjml3jHUFtLOIrvBEkxumsHXUHKI3QxoeousAUHFZhhWIy6PWw
 SOz/wysRbpZLZ17dztnMjrVemj46ieZ9Im6tEQyUpxFQcbgDOwt5vH/FGFqkMLUERBl1
 KILKI3Ew8TpMqH9SCr5781tu3X6UgurmBiW5Hog8X8cHCAjlXKQAgAXlIOHS6R1ksfU0
 m4MWcttW2cUAEAND4IdbaZDXMUpGq9VIWmmra5ToX5KB7q7++WMJQPf9Iqg4nXQWSiWL
 X0Tuo+Wc4dx8FNqba1vbY3J5lZ0GBb5kjKQtdLLz6dd/Em+/vsa1yuI+1lM5zjT8018f
 fraw==
X-Gm-Message-State: AOJu0YwY9+dGGT9XoPqcbSxfNFbrr7Q9q7atjx7VYn0Tyu/oNh88QX7x
 GzGZXKnO0aQ9AaN6dDx1KAq6nFLXL/KCq9qeZxnemrgCHRdFJYILErT2AQXm2ZWAErGx0sI1XqA
 xbi1pXfJ2sbPs7Zbv0ydaMpKdhG8UTOSZnuSqYHdvCw==
X-Received: by 2002:a1c:f204:0:b0:401:73b2:f04d with SMTP id
 s4-20020a1cf204000000b0040173b2f04dmr1397142wmc.14.1694780096483; 
 Fri, 15 Sep 2023 05:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExJPtI+IYCLPfbbQVatowLO2RRsokfIvzSgGwESxjINV6nsoe3beRRdwbN8e/jUfKrdJ6G9Q==
X-Received: by 2002:a1c:f204:0:b0:401:73b2:f04d with SMTP id
 s4-20020a1cf204000000b0040173b2f04dmr1397124wmc.14.1694780096124; 
 Fri, 15 Sep 2023 05:14:56 -0700 (PDT)
Received: from step1.lan ([46.222.72.72]) by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c11ce00b003fee8502999sm7333595wmi.18.2023.09.15.05.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 05:14:55 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 0/5] vsock/test: add recv_buf()/send_buf() utility
 functions and some improvements
Date: Fri, 15 Sep 2023 14:14:47 +0200
Message-ID: <20230915121452.87192-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Bobby Eshleman <bobby.eshleman@bytedance.com>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
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

We recently found that some tests were failing [1].

The problem was that we were not waiting for all the bytes correctly,
so we had a partial read. I had initially suggested using MSG_WAITALL,
but this could have timeout problems.

Since we already had send_byte() and recv_byte() that handled the timeout,
but also the expected return value, I moved that code to two new functions
that we can now use to send/receive generic buffers.

The last commit is just an improvement to a test I found difficult to
understand while using the new functions.

@Arseniy a review and some testing are really appreciated :-)

[1] https://lore.kernel.org/netdev/63xflnwiohdfo6m3vnrrxgv2ulplencpwug5qqacugqh7xxpu3@tsczkuqgwurb/

Stefano Garzarella (5):
  vsock/test: add recv_buf() utility function
  vsock/test: use recv_buf() in vsock_test.c
  vsock/test: add send_buf() utility function
  vsock/test: use send_buf() in vsock_test.c
  vsock/test: track bytes in MSG_PEEK test for SOCK_SEQPACKET

 tools/testing/vsock/util.h       |   3 +
 tools/testing/vsock/util.c       | 124 ++++++++++++--------
 tools/testing/vsock/vsock_test.c | 187 ++++++-------------------------
 3 files changed, 117 insertions(+), 197 deletions(-)

-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
