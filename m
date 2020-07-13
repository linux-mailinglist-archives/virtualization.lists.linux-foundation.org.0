Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA8121D552
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 13:53:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E90F925521;
	Mon, 13 Jul 2020 11:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OqoFaPy4+0p; Mon, 13 Jul 2020 11:53:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1BC7425506;
	Mon, 13 Jul 2020 11:53:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E486FC0733;
	Mon, 13 Jul 2020 11:53:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B961DC0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE668876E7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tM4eixQNKiHs
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:53:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CBADF876E6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:53:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g10so13171126wmc.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 04:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LqnxdlraFGa9oyC6Dgb6a9mOJnjee/T6OYCQNFyIlz8=;
 b=yn3NsfAHu+FbIXw3Q92w6Rs3PfR7AzddGXKTkkZN3Sjt5HbDm21Nt7B7NRDaZaW5q2
 KGPrl1rORhcNfB0tp6QcMj+cqdy22R+ZIHy+6AS16r/ee1MR9NYT5QQ+kRSzMKkc7WlJ
 VuUaFCIuxBTcPzmMQiRAvySDxAKlvvXFElboMKsCp/iwC6opkzVI3AvXaCEun3ScX1Gy
 QJwmpOU3qw2sT2XM8r7zYRuVBNSmo22fG9Lis5Sikq1ulkca0fIHBxZmdKLKMMFARY20
 j8v/5DyCyvZeSk0PML/VGuU5l8D/jqvHc9+c8I7iTkyNbx/YolQV5SuZqHs8qeanjHQu
 4fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LqnxdlraFGa9oyC6Dgb6a9mOJnjee/T6OYCQNFyIlz8=;
 b=RP9tWUMENUv4pHFzSAaf4u6K3OW7H9TvN/iUJ3iKFcPR1p7jtLCk3Sjelgr5IbvVhw
 08t867l4uvYiOInclO3K6KxleEVVKOSANmNxJkn2I7tuGqEHkP6agWiguBrA/kJ7SdX0
 pjbmhKdWIwi0+ypDKLG91Dd+noiqynZb6EAHLWjVB3qNPCfnJ7jGWjd7N5bTN1np+SCx
 6TXDWGjZf4UiLY2Ey++XJnUqvMFC/HDUyaAw9V5hVCgQuZgTolPYwxw5RW1X74p0Vnk2
 zwjcppwlDv2glgxtd+DMrcpbdhdc2fxRJHOR7msyzeBCyFpd+ehIuk7ZGRxlHWxnE2Fc
 dVNA==
X-Gm-Message-State: AOAM531x7Aj3UncwhHFuKKmNUIWYMZ9Ys5ElJxE0malk5g3gLQnAuqQc
 olk3+XABBifmBBDZRdlMjJUrMw==
X-Google-Smtp-Source: ABdhPJxjRNlt8Qj/SHfDfkN36guWr5K2uFmxbVr9DmVfJpCdP/YsDE++05I/pvn3FJdwDptIzOC2Sw==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr17527976wmh.108.1594641230264; 
 Mon, 13 Jul 2020 04:53:50 -0700 (PDT)
Received: from dell ([2.31.163.6])
 by smtp.gmail.com with ESMTPSA id z10sm24303484wrm.21.2020.07.13.04.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 04:53:49 -0700 (PDT)
Date: Mon, 13 Jul 2020 12:53:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 12/24] scsi: virtio_scsi: Demote seemingly
 unintentional kerneldoc header
Message-ID: <20200713115348.GE3500@dell>
References: <20200713080001.128044-1-lee.jones@linaro.org>
 <20200713080001.128044-13-lee.jones@linaro.org>
 <20200713071453-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713071453-mutt-send-email-mst@kernel.org>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 jejb@linux.ibm.com
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

T24gTW9uLCAxMyBKdWwgMjAyMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgoKPiBPbiBNb24s
IEp1bCAxMywgMjAyMCBhdCAwODo1OTo0OUFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBU
aGlzIGlzIHRoZSBvbmx5IHVzZSBvZiBrZXJuZWxkb2MgaW4gdGhlIHNvdXJjZWZpbGUgYW5kIG5v
Cj4gPiBkZXNjcmlwdGlvbnMgYXJlIHByb3ZpZGVkLgo+ID4gCj4gPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+IAo+ID4gIGRyaXZlcnMvc2NzaS92
aXJ0aW9fc2NzaS5jOjEwOTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
dnNjc2knIG5vdCBkZXNjcmliZWQgaW4gJ3ZpcnRzY3NpX2NvbXBsZXRlX2NtZCcKPiA+ICBkcml2
ZXJzL3Njc2kvdmlydGlvX3Njc2kuYzoxMDk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2J1Zicgbm90IGRlc2NyaWJlZCBpbiAndmlydHNjc2lfY29tcGxldGVfY21kJwo+
ID4gCj4gPiBDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+ID4gQ2M6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiBDYzogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPgo+ID4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgo+ID4gQWNrZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+Cj4gCj4gQWNrZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CgpU
aGFuayB5b3UgTWljaGFlbC4KCj4gUGxzIG1lcmdlIHdpdGggdGhlIHJlc3Qgb2YgdGhlIHBhdGNo
ZXMgKHdoaWNoIHRyZWUgaXMgdGhpcyBmb3I/KQoKTXkgYXNzdW1wdGlvbiBpcyB0aGF0IE1hcnRp
biB3aWxsIHRha2UgYWxsIG9mIHRoZXNlIChhbmQgdGhlIG90aGVyCnNldHMpIHZpYSB0aGUgU0NT
SSByZXBvLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQg
LSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
