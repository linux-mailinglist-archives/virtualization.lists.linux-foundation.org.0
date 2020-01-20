Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BEE142A21
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 13:10:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DA5E832FE;
	Mon, 20 Jan 2020 12:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1FqZCBdfUpQ; Mon, 20 Jan 2020 12:10:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A34D9832F8;
	Mon, 20 Jan 2020 12:09:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EFC8C1D88;
	Mon, 20 Jan 2020 12:09:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1C67C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF325874E0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWdonezOYuj6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:09:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6B51A87447
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579522158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ils+V+DNAQCUc++KUaM/zwaIHOd66hKtcZoyoJKDxck=;
 b=XJazi4uvc8FGdXK0hA/jHe7Y8jCenZUr+XMAMOm7NMAJZeomzdavszjWLOjkuS4rsquFSr
 68RtAPmdDl1lOAzTOOu4HdaUlVh63Aps3Eyg3bVcGgoLyz6TIZIuAC3AKF9tYZCHqw4gUY
 Yi/uP6+dDeRNtZ7WY1T4ZP4RG0t2dOs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-x3vpDmi6PvyKZ4IvmCFR6A-1; Mon, 20 Jan 2020 07:09:17 -0500
Received: by mail-qt1-f198.google.com with SMTP id z11so11208422qts.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 04:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ils+V+DNAQCUc++KUaM/zwaIHOd66hKtcZoyoJKDxck=;
 b=X3UxFf7JCVl5FtfLJNEJPF1HpT1C4459ZuPqXU3++3wDB1l5Wng0B+Pel6MWin9y2H
 0sku+OFB1zihKToHnL6etzsvJdx5o7y+KChXzh2slNFbZPYWalqlrJsat8kbOau6UDnG
 YZqZ2HTCrm1ckm43wycR6HzoFHF3Kb4WqDB9XQpi6iTtQQtb6PhxT+tfF3W+BVKmbf5R
 o5lVtN0KhU9r0lcGlsJCoCponNVu31fFTCtbDE13BFAm54nZkUuyazBFz0PeXGvZoTa5
 gmakBDiUDgmO+tuVrF005YRjN7Pm7yKUeZwgKQDuAEjVVUsHQ+Puw3i3XoY9r7Ra5wY1
 QOxg==
X-Gm-Message-State: APjAAAUClA2RKvrlOsOqXccK42xOk8kqynr1iTkXCR5uG1ud7ntfqdIZ
 p7EIH/QLcw9JgH+s9TJsMy/49D/aWPz9Mh8gB75ZRgcMYjnRxqmo7gGEy9p8NheTmkhvtsMOf6w
 33LPy1Jgz4aAs9fL6P6pzOI2gGbQVIgEwAxRIF3JQMg==
X-Received: by 2002:ac8:747:: with SMTP id k7mr20536092qth.120.1579522157153; 
 Mon, 20 Jan 2020 04:09:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPRlGSUNQNiKSICSXdcPuLibX0Cl/JMb+oCpOV4CRtRfGtUmRXGfQQVE1MHMBhude5c31BGg==
X-Received: by 2002:ac8:747:: with SMTP id k7mr20536064qth.120.1579522156954; 
 Mon, 20 Jan 2020 04:09:16 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id t2sm15467285qkc.31.2020.01.20.04.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 04:09:15 -0800 (PST)
Date: Mon, 20 Jan 2020 07:09:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200120070710-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <20200119045849-mutt-send-email-mst@kernel.org>
 <d4e7fc56-c9d8-f01f-1504-dd49d5658037@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d4e7fc56-c9d8-f01f-1504-dd49d5658037@redhat.com>
X-MC-Unique: x3vpDmi6PvyKZ4IvmCFR6A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Shahaf Shuler <shahafs@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "Wang, Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDQ6NDQ6MzRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzEvMTkg5LiL5Y2INTo1OSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gU3VuLCBKYW4gMTksIDIwMjAgYXQgMDk6MDc6MDlBTSArMDAwMCwgU2hhaGFmIFNo
dWxlciB3cm90ZToKPiA+ID4gPiBUZWNobmljYWxseSwgd2UgY2FuIGtlZXAgdGhlIGluY3JlbWVu
dGFsIEFQSQo+ID4gPiA+IGhlcmUgYW5kIGxldCB0aGUgdmVuZG9yIHZEUEEgZHJpdmVycyB0byBy
ZWNvcmQgdGhlIGZ1bGwgbWFwcGluZwo+ID4gPiA+IGludGVybmFsbHkgd2hpY2ggbWF5IHNsaWdo
dGx5IGluY3JlYXNlIHRoZSBjb21wbGV4aXR5IG9mIHZlbmRvciBkcml2ZXIuCj4gPiA+IFdoYXQg
d2lsbCBiZSB0aGUgdHJpZ2dlciBmb3IgdGhlIGRyaXZlciB0byBrbm93IGl0IHJlY2VpdmVkIHRo
ZSBsYXN0IG1hcHBpbmcgb24gdGhpcyBzZXJpZXMgYW5kIGl0IGNhbiBub3cgcHVzaCBpdCB0byB0
aGUgb24tY2hpcCBJT01NVT8KPiA+IFNvbWUga2luZCBvZiBpbnZhbGlkYXRlIEFQST8KPiA+IAo+
IAo+IFRoZSBwcm9ibGVtIGlzIGhvdyB0byBkZWFsIHdpdGggdGhlIGNhc2Ugb2YgdklPTU1VLiBX
aGVuIHZJT01NVSBpcyBlbmFibGluZwo+IHRoZXJlJ3Mgbm8gY29uY2VwdCBvZiBsYXN0IG1hcHBp
bmcuCj4gCj4gVGhhbmtzCgpNb3N0IElPTU1VcyBoYXZlIGEgdHJhbnNsYXRpb24gY2FjaGUgc28g
aGF2ZSBhbiBpbnZhbGlkYXRlIEFQSSB0b28uCgotLSAKTVNUCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
