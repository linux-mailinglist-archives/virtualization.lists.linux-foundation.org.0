Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1121C6FC1
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 13:57:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8697A2046F;
	Wed,  6 May 2020 11:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJdJHDOa2Y0v; Wed,  6 May 2020 11:57:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5E03C24F0C;
	Wed,  6 May 2020 11:57:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A261C088B;
	Wed,  6 May 2020 11:57:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07F3FC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EB566876F9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0IletNKUB20
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0884B8758D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588766267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SQDFnlIJbT5ua1JOyFwQCxTImV9nf4dY7BK+J1cBSE=;
 b=fVO5Ddl3bulPKi/gByVHCqOr/l1SwSAzqUlEHpfGrhQt23K29RCOY34MJi8OhOVNwhBIBd
 c4JjscmggfhcN8/OuTQ3fz4JSRJ9PUGXOVXLCdYHvkJA3CZWcm63fc01+BQnyfOKPbzfZr
 e9XnRRqA8t1+zri58pyTGAKlXlGOEm4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-5j2GAindP96dehiqz-hgvw-1; Wed, 06 May 2020 07:57:45 -0400
X-MC-Unique: 5j2GAindP96dehiqz-hgvw-1
Received: by mail-wr1-f70.google.com with SMTP id q13so1187810wrn.14
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 04:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8SQDFnlIJbT5ua1JOyFwQCxTImV9nf4dY7BK+J1cBSE=;
 b=g5drZBKXV+ILHLeUs0oNWa34cRTcVkAOwFfXfAaiz1PgyjvgOCQq2XopNhAPcQTFal
 QYB4ZkMLHNiq874v5Y8/ccJvhVBlaYol6QCTzrBJmJ02+yL8zSVRnJueouF0yfOpNKS1
 AaQ1fnBixkSfl7DB6T1uRFg6cWjtlkBec580VpRBIljefM+C7gU2imwZfwGELan/o/CL
 SMQIqBrnl1zw3HQQIaUOCLC5mftCYHD2zn//RLAq/htbeNQpdAHThlqny0pF7bk4l6DZ
 47pXKqaMOJSL2/UM0wlfc6VbXujU37UoeKEjUhbAJBLDiSh8Na7CrzlawbfpLgCnRylq
 WHZQ==
X-Gm-Message-State: AGi0PuZJpPYnpJA6WRX4XNdZfbYT6KmmvI/lNyjQ4Euc+xOnsFl7F2DP
 fSCAQIXDqJTpWmiYuMebj3u6dt/heucCYoxN294blvOBUgm5+1l8wZApikrt5QD5tXULymmwomY
 lc3SD6pAgswbR2Xt0+0osrfewdTu4tK2s1Ic0dolB7Q==
X-Received: by 2002:a05:600c:2210:: with SMTP id
 z16mr4188080wml.151.1588766264429; 
 Wed, 06 May 2020 04:57:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypKgPL6Idtx8YS8ZSPniHEZVsgz6k4KI77A+1MaVArInKjm4b6YSX9fRi88QPhdunVwvyGecRg==
X-Received: by 2002:a05:600c:2210:: with SMTP id
 z16mr4188044wml.151.1588766264058; 
 Wed, 06 May 2020 04:57:44 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 a139sm1060804wme.18.2020.05.06.04.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 04:57:43 -0700 (PDT)
Date: Wed, 6 May 2020 07:57:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: performance bug in virtio net xdp
Message-ID: <20200506075719-mutt-send-email-mst@kernel.org>
References: <20200506035704-mutt-send-email-mst@kernel.org>
 <7d801479-5572-0031-b306-a735ca4ce0e4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7d801479-5572-0031-b306-a735ca4ce0e4@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>, bpf@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBNYXkgMDYsIDIwMjAgYXQgMDQ6Mzc6NDFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzUvNiDkuIvljYg0OjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBTbyBmb3IgbWVyZ2VhYmxlIGJ1ZnMsIHdlIHVzZSBld21hIG1hY2hpbmVyeSB0byBndWVz
cyB0aGUgY29ycmVjdCBidWZmZXIKPiA+IHNpemUuIElmIHdlIGRvbid0IGd1ZXNzIGNvcnJlY3Rs
eSwgWERQIGhhcyB0byBkbyBhZ2dyZXNzaXZlIGNvcGllcy4KPiA+IAo+ID4gUHJvYmxlbSBpcywg
eGRwIHBhdGhzIGRvIG5vdCB1cGRhdGUgdGhlIGV3bWEgYXQgYWxsLCBleGNlcHQKPiA+IHNvbWV0
aW1lcyB3aXRoIFhEUF9QQVNTLiBTbyB3aGF0ZXZlciB3ZSBoYXBwZW4gdG8gaGF2ZQo+ID4gYmVm
b3JlIHdlIGF0dGFjaCBYRFAsIHdpbGwgbW9zdGx5IHN0YXkgYXJvdW5kLgo+IAo+IAo+IEl0IGxv
b2tzIG9rIHRvIG1lIHNpbmNlIHdlIGFsd2F5cyB1c2UgUEFHRV9TSVpFIHdoZW4gWERQIGlzIGVu
YWJsZWQgaW4KPiBnZXRfbWVyZ2VhYmxlX2J1Zl9sZW4oKT8KPiAKPiBUaGFua3MKPiAKCk9oIHJp
Z2h0LiBHb29kIHBvaW50ISBBbnN3ZXJlZCBpbiBhbm90aGVyIHRocmVhZC4KCj4gPiAKPiA+IFRo
ZSBmaXggaXMgcHJvYmFibHkgdG8gdXBkYXRlIGV3bWEgdW5jb25kaXRpb25hbGx5Lgo+ID4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
