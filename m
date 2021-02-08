Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A773131B8
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 13:04:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A54B8708E;
	Mon,  8 Feb 2021 12:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c+F0AfY+hUXI; Mon,  8 Feb 2021 12:04:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5AEF87089;
	Mon,  8 Feb 2021 12:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1ED5C013A;
	Mon,  8 Feb 2021 12:04:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B924AC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 12:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A71DE84E49
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 12:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7NGrNn5iFpy
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 12:04:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ADEBE84D9A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 12:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612785868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Qs++Eyz+FNoD/j1mZztLeb+tABoZMU/k2xT8BiHAls=;
 b=HhY0QJ7N9zEd4zLSxN9Q6q6GVUPPKsd17rC+WM3HvemTvnb0NddCshroZlyg4Yodoe/8lg
 0uJTVU6ee7379QqEsiiA2lvrBx7kfe7KKs6yNVPWRAIBpMu9tqrw2QFJNtrKPLDylX8wr7
 mb7SkDz8Ll2ZQeeoqwNLmEhNC4MyIsg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-WgCfJucKOQSemW8xnNuS8g-1; Mon, 08 Feb 2021 07:04:26 -0500
X-MC-Unique: WgCfJucKOQSemW8xnNuS8g-1
Received: by mail-ej1-f71.google.com with SMTP id jg11so11514954ejc.23
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Feb 2021 04:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3Qs++Eyz+FNoD/j1mZztLeb+tABoZMU/k2xT8BiHAls=;
 b=GinCRS3ErSoJzPIrxAB974GGL5ez36tfWYLeiROlhZlak6M9C7dXXZ2EVqwZlGxCRZ
 66YYsHHZuAYaAlO4DazKiU7hKSzZirbrVl1fmnSGqgoss6D7njyJUX/xEmJa1iTN2oLJ
 YBjNBgKmneTlpCAn2CjoC4lIEMFiPL1St/tQRS4G6wXJZw9/8aUiEPLfebOV/kHV2T7P
 qhBy5WGTjWkqdS+CZDH2dqvYfY4fjdtXTy6H0A+TK6FBCcK3nGcuZBnxBEp2MCYD4LyF
 DVX1S3TRMJEYiG3x1KO7MqBUv9v6dENH+btCZSJWyoJmmjSxjm8EP4Tg4WDD+U43nebA
 rehQ==
X-Gm-Message-State: AOAM530EGUnyYMZRmut51gnQ+m5ZQ23gl1qQGznfnmIoKo0dBTy5aAA6
 +EISZU+uDlzBE8GHQN4OKPhrScYvPTvcQdH/14dd7oSKxZBkI4L9xJ4FzGVBtAHTu1pwNwpPzy/
 TAZhNTJ0IOhq66pLNDiJ0U76zIRdO0jlhZmblYmKFtQ==
X-Received: by 2002:a05:6402:2053:: with SMTP id
 bc19mr16399263edb.230.1612785864894; 
 Mon, 08 Feb 2021 04:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYh81U7rVWWzDv0BWgV8P8Ma0koPf4ZMd7UjCWGCkcVoSWZ76oz/S0Urwra0A/6eX0YuanFA==
X-Received: by 2002:a05:6402:2053:: with SMTP id
 bc19mr16399251edb.230.1612785864712; 
 Mon, 08 Feb 2021 04:04:24 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id b2sm9191594edk.11.2021.02.08.04.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:04:24 -0800 (PST)
Date: Mon, 8 Feb 2021 07:04:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 16/19] virtio-pci: introduce modern device module
Message-ID: <20210208070253-mutt-send-email-mst@kernel.org>
References: <20210104065503.199631-1-jasowang@redhat.com>
 <20210104065503.199631-17-jasowang@redhat.com>
 <20210205103214-mutt-send-email-mst@kernel.org>
 <24cb3ebe-1248-3e31-0716-cf498cf1d728@redhat.com>
MIME-Version: 1.0
In-Reply-To: <24cb3ebe-1248-3e31-0716-cf498cf1d728@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

T24gTW9uLCBGZWIgMDgsIDIwMjEgYXQgMDE6NDI6MjdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIxLzIvNSDkuIvljYgxMTozNCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gTW9uLCBKYW4gMDQsIDIwMjEgYXQgMDI6NTU6MDBQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQu
Y29tPgo+ID4gSSBkb24ndCBleGFjdGx5IGdldCB3aHkgd2UgbmVlZCB0byBzcGxpdCB0aGUgbW9k
ZXJuIGRyaXZlciBvdXQsCj4gPiBhbmQgaXQgY2FuIGNvbmZ1c2UgcGVvcGxlIHdobyBhcmUgdXNl
ZCB0byBiZSBzZWVpbmcgdmlydGlvLXBjaS4KPiAKPiAKPiBUaGUgdmlydGlvLXBjaSBtb2R1bGUg
c3RpbGwgdGhlcmUuIE5vIHVzZXIgdmlzaWJsZSBjaGFuZ2VzLiBKdXN0IHNvbWUgY29kZXMKPiB0
aGF0IGNvdWxkIGJlIHNoYXJlZCB3aXRoIG90aGVyIGRyaXZlciB3ZXJlIHNwbGl0IG91dC4KPiAK
CldoYXQgSSBhbSBzYXlpbmcgaXMgdGhpczogd2UgY2FuIGhhdmUgdmlydGlvLXZkcGEgZGVwZW5k
IG9uCnZpcnRpby1wY2kgd2l0aG91dCBzcGxpdHRpbmcgdGhlIGNvbW1vbiBjb2RlIG91dCB0byBh
bgpleHRyYSBtb2R1bGUuCgo+ID4gCj4gPiBUaGUgdmRwYSB0aGluZyBzbyBmYXIgbG9va3MgbGlr
ZSBhIGRldmVsb3BtZW50IHRvb2wsIHdoeSBkbwo+ID4gd2UgY2FyZSB0aGF0IGl0IGRlcGVuZHMg
b24gYSBiaXQgb2YgZXh0cmEgY29kZT8KPiAKPiAKPiBJZiBJJ20gbm90IG1pc3VuZGVyc3RhbmRp
bmcsIHRyeWluZyB0byBzaGFyZSBjb2RlcyBpcyBwcm9wb3NlZCBieSB5b3UgaGVyZToKPiAKPiBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC82LzEwLzIzMgo+IAo+IFdlIGFsc28gaGFkIHRoZSBw
bGFuIHRvIGNvbnZlcnQgSUZDVkYgdG8gdXNlIHRoaXMgbGlicmFyeS4KPiAKPiBUaGFua3MKCklm
IHRoYXQgaGFwcGVucyB0aGVuIGFuIGV4dHJhIG1vZHVsZSBtaWdodCBiZWNvbWUgdXNlZnVsLgoK
LS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
