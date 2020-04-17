Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 216F61ADA20
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 11:38:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A334520408;
	Fri, 17 Apr 2020 09:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzAyCeL57xGq; Fri, 17 Apr 2020 09:38:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6027E20030;
	Fri, 17 Apr 2020 09:38:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E9F4C0172;
	Fri, 17 Apr 2020 09:38:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A684AC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9E9C483138
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4yUeq9ACMAI
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:38:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 100118284B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587116324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVkbDn8gkw5+Noos0y5yOQUyWaS8jqC9S0wOjm7uqw4=;
 b=E7yXcE89s8jUeGNZATNBPoSWrofGS94YVwHEkjOM1Zbj93t+wjSsvXUp8kQp3ppEDp76GZ
 0QycDRKY8T5P+F+X3L8f+xgNB/bQIHoBt6VWMU4KuwyJGJB6ej1bcfWMNzHCENw4W8uC1d
 gPzgPXP4TwoNcOd0ZC0km/IVtsgORRs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-GecViBR8NWC_87HQsTJ1pA-1; Fri, 17 Apr 2020 05:38:43 -0400
X-MC-Unique: GecViBR8NWC_87HQsTJ1pA-1
Received: by mail-wm1-f71.google.com with SMTP id f128so716797wmf.8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 02:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EVkbDn8gkw5+Noos0y5yOQUyWaS8jqC9S0wOjm7uqw4=;
 b=mIk3NP/8i050ftGA+1jCTVMsGYsuS4KkESZLZ51vTJL4gIZn9mx2H3Dko+Y2dLVlSQ
 kTlZPQI5e76ob1XCulxzBjsWUH4Gc38UgnCw5qK5ntFWHNQ46kvwWQAxRPz5OR8Mq1z3
 tJ3Z7dlwwBQzG81Kol2l0tw7W5qI9TN0Bm3ychMg9LEZcwHs9w+GtY+PYh7cTr4f1Y8F
 gPA8zNy7OYzCh4J6kDYFHrCJvCKN0OZuvHwsjinx5mY/drTAaFt0JRuau+PP3ze0yQxN
 nDcPUFKz0gtQEQfp7V+NVpGVAdQKDLpoFRU8PHM57zkKgBGLgdXoRoJ09EMN+TKtQyMD
 72BA==
X-Gm-Message-State: AGi0PuZkEgLSvr+qQ78Xhe+pRSqQhU7Eljb0Z+m8kjMv5rmFjGTXDwAp
 0ItDuu2vQ0b30hxdS0MecjWPE1UMc1d2LAPJTfT99q/GMlwkJnNz4xyUQZFUfM/4HoTI2bI1CkV
 4gRs8JfuOZ7V9EXaXAjVGxo21t2pBF4Z8JfUlPYLFDw==
X-Received: by 2002:adf:e711:: with SMTP id c17mr1264154wrm.334.1587116322163; 
 Fri, 17 Apr 2020 02:38:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypLI0ZplMhJRXp9IgnvDd4jNrwD2zcF2noQBvqCsovqT0NxBwm05qUG6Nsovmh0zi9ATjf9KqA==
X-Received: by 2002:adf:e711:: with SMTP id c17mr1264134wrm.334.1587116321952; 
 Fri, 17 Apr 2020 02:38:41 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id a24sm6912835wmb.24.2020.04.17.02.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:38:41 -0700 (PDT)
Date: Fri, 17 Apr 2020 05:38:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417053803-mutt-send-email-mst@kernel.org>
References: <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
 <20200417050029-mutt-send-email-mst@kernel.org>
 <ce8a18e5-3c74-73cc-57c5-10c40af838a3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ce8a18e5-3c74-73cc-57c5-10c40af838a3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDU6MzM6NTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMTcg5LiL5Y2INTowMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gPiBUaGVyZSBjb3VsZCBiZSBzb21lIG1pc3VuZGVyc3RhbmRpbmcgaGVyZS4gSSB0aG91
Z2h0IGl0J3Mgc29tZWhvdyBzaW1pbGFyOiBhCj4gPiA+IENPTkZJR19WSE9TVF9NRU5VPXkgd2ls
bCBiZSBsZWZ0IGluIHRoZSBkZWZjb25maWdzIGV2ZW4gaWYgQ09ORklHX1ZIT1NUIGlzCj4gPiA+
IG5vdCBzZXQuCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gCj4gPiBCVFcgZG8gZW50cmllcyB3
aXRoIG5vIHByb21wdCBhY3R1YWxseSBhcHBlYXIgaW4gZGVmY29uZmlnPwo+ID4gCj4gCj4gWWVz
LiBJIGNhbiBzZWUgQ09ORklHX1ZIT1NUX0RQTj15IGFmdGVyIG1ha2UgQVJDSD1tNjhrIGRlZmNv
bmZpZwoKWW91IHNlZSBpdCBpbiAuY29uZmlnIHJpZ2h0PyBTbyB0aGF0J3MgaGFybWxlc3Mgcmln
aHQ/CgotLSAKTVNUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
