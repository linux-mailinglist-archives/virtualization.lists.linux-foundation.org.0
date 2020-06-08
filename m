Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B78501F1305
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 08:46:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7648685540;
	Mon,  8 Jun 2020 06:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGA8Mc69qjBF; Mon,  8 Jun 2020 06:46:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 112798554A;
	Mon,  8 Jun 2020 06:46:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7A1CC016F;
	Mon,  8 Jun 2020 06:45:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51B86C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 40A3085540
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6k66lqKRz_BM
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:45:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AC7CA84B6F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591598756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05DDfjAfIHUdRf5Uem2N9ccJI7OdmXrAgeiSijOGnoQ=;
 b=fwRjNkpGXZWdAMpa4vXELZvaRC/oEUa7Ee1E8TWf45Fdo/S3Pdf42us8QV/Cy1AuMMKKLK
 ZUm2WEAC3+iZU+pnHCF2fnpeEby3b+DXIb0Y7qQut8oVjMGJD46ySi4ZlkGx+tUg/yLIZd
 dQbKGDEgnX0fNhuRJrTywMIlIQcIMkE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-0dqWJFAOP--R7Ef3NwY2ZQ-1; Mon, 08 Jun 2020 02:45:54 -0400
X-MC-Unique: 0dqWJFAOP--R7Ef3NwY2ZQ-1
Received: by mail-wr1-f72.google.com with SMTP id n6so6762231wrv.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 23:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=05DDfjAfIHUdRf5Uem2N9ccJI7OdmXrAgeiSijOGnoQ=;
 b=aoEFPzlotNI/qQZkY7HooLCvgA4DFPLAOBNzjmHdRNlUcWn2w0n4f7ia/CjenyjBPT
 GQhkr5+Seaic1NaHu1r3qKOEYeqRxLQnDKYpTmxkPWomp2pT/vskfki5hFZOmQ8433QR
 4edXA2+Hj2TQB/1887+OaGRomGHS8CExWRMnkfUPoqyCBSQHB26c7EQRXPzrxIzHEnWd
 a39Ekb4cW4slpBkzsdXSplVFWp+LyLUgiMNQYlGntvGE2jX3Du77BZx/lhgYvB+tvHmM
 Urzo/1I4xPLH8TtRp/4TIaOMeH1joNc6C87cmtQ8DtI/Q6tVkVtbO8tBDpqHycAx0H29
 d/gg==
X-Gm-Message-State: AOAM5301tu3r3GzvJ9WZ4IxZxUQ4h7tfZ8d93Nja9OnYqZK8Ub0GG1Ln
 SriikVrv+AcD7HS8U/NNasQmNWtrtPEV1ExjLF3yfoGku9eyFLbMqnyZ9DEaJDWv26DHtWrA1v8
 3Zp1f6M+mGsti/g4b27T8sdtTxga/pXuH9GuszXYFiA==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr22608220wrc.246.1591598753583; 
 Sun, 07 Jun 2020 23:45:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKhmvKgwfu6GksB3KTO4SFsuK8YxZWmnpeKf96R+VzqaaCilkPcOAlU2/3T/svRcNiLt4VEA==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr22608211wrc.246.1591598753423; 
 Sun, 07 Jun 2020 23:45:53 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 x18sm20730927wmi.35.2020.06.07.23.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 23:45:52 -0700 (PDT)
Date: Mon, 8 Jun 2020 02:45:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v5 13/13] vhost: drop head based APIs
Message-ID: <20200608023311-mutt-send-email-mst@kernel.org>
References: <20200607141057.704085-1-mst@redhat.com>
 <20200607141057.704085-14-mst@redhat.com>
 <8e3f5b6f-a47b-73cd-e8e3-959d40f6c91c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8e3f5b6f-a47b-73cd-e8e3-959d40f6c91c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eperezma@redhat.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

T24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMTE6NTc6NDhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvNyDkuIvljYgxMDoxMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gRXZlcnlvbmUncyB1c2luZyBidWYgQVBJcywgbm8gbmVlZCBmb3IgaGVhZCBiYXNlZCBv
bmVzIGFueW1vcmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbjxt
c3RAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAzNiAr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgZHJpdmVycy92aG9zdC92
aG9zdC5oIHwgMTIgLS0tLS0tLS0tLS0tCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA0MCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+ID4gaW5kZXggNzJlZTU1YzgxMGM0
Li5lNjkzMWI3NjBiNjEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiA+
ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+ID4gQEAgLTIyOTksMTIgKzIyOTksMTIgQEAg
c3RhdGljIGludCBmZXRjaF9idWYoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4gPiAgIAly
ZXR1cm4gMTsKPiA+ICAgfQo+ID4gLS8qIFJldmVyc2UgdGhlIGVmZmVjdCBvZiB2aG9zdF9nZXRf
dnFfZGVzYy4gVXNlZnVsIGZvciBlcnJvciBoYW5kbGluZy4gKi8KPiA+ICsvKiBSZXZlcnQgdGhl
IGVmZmVjdCBvZiBmZXRjaF9idWYuIFVzZWZ1bCBmb3IgZXJyb3IgaGFuZGxpbmcuICovCj4gPiAr
c3RhdGljCj4gPiAgIHZvaWQgdmhvc3RfZGlzY2FyZF92cV9kZXNjKHN0cnVjdCB2aG9zdF92aXJ0
cXVldWUgKnZxLCBpbnQgbikKPiA+ICAgewo+ID4gICAJdnEtPmxhc3RfYXZhaWxfaWR4IC09IG47
Cj4gPiAgIH0KPiA+IC1FWFBPUlRfU1lNQk9MX0dQTCh2aG9zdF9kaXNjYXJkX3ZxX2Rlc2MpOwo+
IAo+IAo+IFRoZSBzYW1lIHF1ZXN0aW9uIGFzIHByZXZpb3VzIHZlcnNpb24uCj4gCj4gRG8gd2Ug
bmVlZCB0byByZXdpbmQgY2FjaGVkIGRlc2NyaXB0b3IgaGVyZT8KPiAKPiBUaGFua3MKCkdvb2Qg
cG9pbnQuICBUaGlzIG5lZWRzIG1vcmUgdGhvdWdodCwgd2UgbmVlZCB0byBhbHNvCnJld2luZCB0
aGUgYXZhaWwgaWR4IGVhY2ggdGltZSB3ZSBmbHVzaCB0aGUgZGVzY3JpcHRvciBjYWNoZS4KCi0t
IApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
