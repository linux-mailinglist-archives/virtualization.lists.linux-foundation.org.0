Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD438FACE
	for <lists.virtualization@lfdr.de>; Tue, 25 May 2021 08:21:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB18607B8;
	Tue, 25 May 2021 06:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfMQTzVIRqLn; Tue, 25 May 2021 06:21:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92C2F607C5;
	Tue, 25 May 2021 06:21:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28E00C0024;
	Tue, 25 May 2021 06:21:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7DD0C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C68C8404DA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBz2-6ma0qRv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:21:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1A854045E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 May 2021 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621923668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WiJscerR2fDA86UhiPAlFUiqwQShLis3q+i9fxiZJa0=;
 b=a2cvyGpUtqc0kBUx2OpB2UtrNKUNCm26mWBMNp1Flx7/3uKZtH8h5mmsqbgNI2PxGbc5Kc
 zSYknPWWKY299bGdlnF/l8FRCZZwi6Ku8aTS+ASUYffG2WU+8f0DfKE225Y21iDRTSpfMy
 uCo7u2RAMW4oBBQr11wmLhWRXvvc37Q=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-TqOa0-PgMCiLybO9Z9vnSg-1; Tue, 25 May 2021 02:21:04 -0400
X-MC-Unique: TqOa0-PgMCiLybO9Z9vnSg-1
Received: by mail-pj1-f71.google.com with SMTP id
 q88-20020a17090a4fe1b029015d5a5f2427so14180529pjh.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 23:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WiJscerR2fDA86UhiPAlFUiqwQShLis3q+i9fxiZJa0=;
 b=dTvANH/m4AvtRgJRJRr/yNJBV8JgfvAWwXliZ0Z7sGhb/oRsO3WS+4PjIbbKDa7RCV
 RvkStwOV1pIsJo0/EuzyORvJcamR8EpjV6U5hBNJLCv9Uh2WEaDFO2BTHHnUhEpG1UEH
 sfHoTaUe2iRp42y+KZvSb1pfg30lmF6jWXNAR2oYFUzNkWFWlx3TcCEZi57t4yiIsWp/
 7AnhtjHh4aQjL2FF9uCBA5FHUJZ/ohNOhm7HjzgEmDjxghRY8YbYcMATPIr0v5rAoxHa
 p9Sx9DQdS82pH6irdS4rcJnvj8ZSEi8bXNiG1uUH5GRzxexeA7mmzkrtsY30SUsyg0Y8
 MtLg==
X-Gm-Message-State: AOAM532OfSvYw9lpItp73S4C6m3DrgkxnLNCGqpRC2z+krBemyY6FDVX
 IHSygzPLAKLALzzFRmJbvooYxZ4EeNHMhXdGH761QH/yU+UCZgha/Mu8o9BWe1cyLDyxrAUEDA7
 uXjQQKKrkd82O4l3xGza73CRaKe86q9Fb/HBkIB1Xbw==
X-Received: by 2002:a17:902:f68f:b029:ef:919c:39f2 with SMTP id
 l15-20020a170902f68fb02900ef919c39f2mr29354312plg.41.1621923663184; 
 Mon, 24 May 2021 23:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/AkdQfofCrwVKmLTvITcgxgLRS3oscM8uQK+fg65jRMq4L1+zD/Skixv+Y2qe5pD9dBgdgg==
X-Received: by 2002:a17:902:f68f:b029:ef:919c:39f2 with SMTP id
 l15-20020a170902f68fb02900ef919c39f2mr29354294plg.41.1621923662926; 
 Mon, 24 May 2021 23:21:02 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g4sm13261878pgu.46.2021.05.24.23.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 23:21:02 -0700 (PDT)
Subject: Re: [PATCH] virtio-blk: Fix memory leak among suspend/resume procedure
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com, stefanha@redhat.com
References: <20210517084332.280-1-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <80e28363-4ee6-ab9f-90d9-f24e38e360da@redhat.com>
Date: Tue, 25 May 2021 14:20:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210517084332.280-1-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNS8xNyDPws7nNDo0MywgWGllIFlvbmdqaSDQtLXAOgo+IFRoZSB2YmxrLT52cXMg
c2hvdWxkIGJlIGZyZWVkIGJlZm9yZSB3ZSBjYWxsIGluaXRfdnFzKCkKPiBpbiB2aXJ0YmxrX3Jl
c3RvcmUoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpZSBZb25namkgPHhpZXlvbmdqaUBieXRlZGFu
Y2UuY29tPgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4g
LS0tCj4gICBkcml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3ZpcnRp
b19ibGsuYyBiL2RyaXZlcnMvYmxvY2svdmlydGlvX2Jsay5jCj4gaW5kZXggMzY3YTFlOTI5ZDdj
Li5kMjRhOGNlYTlhYWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay92aXJ0aW9fYmxrLmMK
PiArKysgYi9kcml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYwo+IEBAIC05NDgsNiArOTQ4LDggQEAg
c3RhdGljIGludCB2aXJ0YmxrX2ZyZWV6ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAg
IAlibGtfbXFfcXVpZXNjZV9xdWV1ZSh2YmxrLT5kaXNrLT5xdWV1ZSk7Cj4gICAKPiAgIAl2ZGV2
LT5jb25maWctPmRlbF92cXModmRldik7Cj4gKwlrZnJlZSh2YmxrLT52cXMpOwo+ICsKPiAgIAly
ZXR1cm4gMDsKPiAgIH0KPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
