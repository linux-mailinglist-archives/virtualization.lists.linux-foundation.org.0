Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B2D5629
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 14:14:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E86962382;
	Sun, 13 Oct 2019 12:14:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3D4592373
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 12:01:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3CBC15D3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1570968064;
	bh=zkVikWj3rydfNcm+Xoq/QEW9TfTobJDKETVMlO8u4Qw=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=FgeZ2IwCJd9As1cD1JAnVbr/K6oK0OvlPBl4hMwyAYB8/uEKrtW32heN0YQ82ZzI+
	0uhNwbk29KlW5UgQCDZAp36+ZJcSGMXzmKJDo2krTqm6BeGQ4SluwNGWnLc7qDQ0w1
	z0O3v8+KDQJFgyPP/HjPHIsWi2jLxpq00Yr8TwNU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb002
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0MP047-1iOHWp0hYl-006Pt8;
	Sun, 13 Oct 2019 14:01:04 +0200
Subject: Re: [PATCH] tools/virtio: Fix build
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <4b686914-075b-a0a9-c97b-9def82ee0336@web.de>
	<20191013075107-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <08c1e081-765b-7c3a-ed31-2059dc521fd0@web.de>
Date: Sun, 13 Oct 2019 14:01:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191013075107-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Provags-ID: V03:K1:XIC4E25Ila5IabwhKzDJLfSktbAUNiL1h/Z1laTjqOl/uSmn5ZJ
	p1+l57O65WSlab5fR9quhOrAQ8ZjI4palVMKDlX+BkFoaA3LRx/vnRI83Xsju+7jV7faovk
	7VBo8b3wSwAd5CD4eo+G4cLoWejNKDM/+y5nbZGUtPI5Z60PJMGGx+Aob+PdO65vPA9RzkI
	Z00hv1xkvK13mbcnyI0tA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q/mlyFMjhfQ=:Uba6L31Yxx0a/9byemws44
	vi/2SA1DtNqZfn1D/hbJIPJrvI7/K8H00fZmvvVi1uALVNc9RoJcJf2UOuvSvfRkRh2/LaEQv
	ZuzWVftoxI+4VpUEEMYZTLxDUt8vEZm4qVPJ+hEoq6PK8ZH55J25jP6a3zxDAKX1V1mdJdSao
	RsCA3T3a473iJNShMygTILTekaUCowy0aNJmBUhfgGb/C0MZWhtZ8gH9/o5RERagtJIT34dSX
	8bP/UEBmO7OIRAxAqf1Y5KOlGX3GEJVWr+VvA78l/IYJEEsBQkU5aYkaB/na1KP966e+otNio
	4mX3CoVaH+62eqsDdig9S3SGH1NNua7dGphc7htp7RYZ93mq269H7m4O6VuQ3W11qEswipgKD
	8mbsXgldzNL/7Evo2kGi3kvPPdaF1Y04AiRrI5TYnA5YhVpRIUEnrxtzUv/G3csv6URvH5Gh4
	GW6kVxVRoAMu0deaDTLwNcA7OCq9+6NKLw2DRYpLJS8GFBuFl9AhaCQNmJSHL+nfaF0UKjdg4
	hmVqEUgbxxkqL1jdTtUFrVQUpXy2HptfdggLOLv/WMTzzrd7U32p7ye26vPCOA3037UYMQLfj
	DxHDTZ2jiHlLfqD1WOb4XIy5CPEwpegI6gMc17I7HvaeafGYS/2mrW+y3pwX85N9NsUZLMWns
	9SdmCeTk7SlAlFrpVq9RlrLNgFKx7yEYUDPlMel7hl9dKuyK9QgJgGWpdn6OkhAuRIdqkaiDE
	UDoXztDRckdLsGZqbgAP7K28etweSvOQcRI/SKE5B0tI9STEYbxnJhA7K58wUrKj9AS+Oh4Bw
	2+JE9XA5Re0ASeP0mPbzv9fvhGbDpGP5dSfExCUq3it+yPtNI9INjOefCTNHvNNqhsAkoV71o
	oIcUUYRrufeicUCn2pZQ73f0aAOty8eMBaULe69SUWXQlCzS8RMml2z4X7UEprhxG34DU5VlO
	WVjg1rbQhybaw7Gp6PkGpJHs79HiD3lMlta5CZ1/OQ5S2LUmq7R0nbXN2YMyNkrbeRPz/OHsq
	Hw99cG0cV1QE9mVfjzXi8ckKPCblsnYNYrrlZLb3GU1yrhchH+Z9lL7BfRt6MN20n3oxxxgGI
	uTnQ42Dqoi0RtdfJ9NleGs7pZ2i8qCkWAtW9JlAHwjSw0t/C2M0jPzWTB20bPnRKlFzrP0SU7
	AZ4+ce8mILmx8kBbP4sPVgGTaAkf3picIKEDdZQx06mwL5ktwu/6Zdqw5xuAjls30Pu5ZVYDS
	ZDAWY6mEDRD7cd1zPm2v3clXxlZHOjVxt13HOFfPgmypZ2GiFlqs7ExcjQi8=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 13.10.19 13:52, Michael S. Tsirkin wrote:
> On Sun, Oct 13, 2019 at 11:03:30AM +0200, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Various changes in the recent kernel versions broke the build due to
>> missing function and header stubs.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>
> Thanks!
> I think it's already fixes in the vhost tree.
> That tree also includes a bugfix for the test.
> Can you pls give it a spin and report?

Mostly fixed: the xen_domain stup is missing.

Jan

> Thanks!
>
>> ---
>>  tools/virtio/crypto/hash.h       | 0
>>  tools/virtio/linux/dma-mapping.h | 2 ++
>>  tools/virtio/linux/kernel.h      | 2 ++
>>  3 files changed, 4 insertions(+)
>>  create mode 100644 tools/virtio/crypto/hash.h
>>
>> diff --git a/tools/virtio/crypto/hash.h b/tools/virtio/crypto/hash.h
>> new file mode 100644
>> index 000000000000..e69de29bb2d1
>> diff --git a/tools/virtio/linux/dma-mapping.h b/tools/virtio/linux/dma-mapping.h
>> index f91aeb5fe571..db96cb4bf877 100644
>> --- a/tools/virtio/linux/dma-mapping.h
>> +++ b/tools/virtio/linux/dma-mapping.h
>> @@ -29,4 +29,6 @@ enum dma_data_direction {
>>  #define dma_unmap_single(...) do { } while (0)
>>  #define dma_unmap_page(...) do { } while (0)
>>
>> +#define dma_max_mapping_size(d)	0
>> +
>>  #endif
>> diff --git a/tools/virtio/linux/kernel.h b/tools/virtio/linux/kernel.h
>> index 6683b4a70b05..ccf321173210 100644
>> --- a/tools/virtio/linux/kernel.h
>> +++ b/tools/virtio/linux/kernel.h
>> @@ -141,4 +141,6 @@ static inline void free_page(unsigned long addr)
>>  #define list_for_each_entry(a, b, c) while (0)
>>  /* end of stubs */
>>
>> +#define xen_domain() 0
>> +
>>  #endif /* KERNEL_H */
>> --
>> 2.16.4
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
